-- "Macros"
local pd <const> = playdate
local gfx <const> = playdate.graphics

class('Player').extends(gfx.sprite)

-- Variables
local playerSpeed = 1
local playerImage = gfx.image.new("images/player")

-- Create event
function Player:init(x, y)
  Player.super.init(self)
  self:setImage(playerImage)
  self:setSize(playerImage:getSize())
  self:setCenter(0, 0)
  self:moveTo(x, y)
  self:setCollideRect(3, 3, self.width -10, self.height-5)

  self:setGroups(COLLISION_GROUPS.player)
  self:setTag(TAGS.Player)

  self:add()
end

-- Player collision response 
function Player:collisionResponse(other)
  local tag = other:getTag()
  if tag == TAGS.Collectable or tag == TAGS.Obstacle or tag == TAGS.Interactable or tag == TAGS.Destructable then
    return gfx.sprite.kCollisionTypeOverlap
  elseif tag == TAGS.Solid then
    return gfx.sprite.kCollisionTypeSlide
  end

  return gfx.sprite.kCollisionTypeSlide
end

-- Custom functions

--Player Movement and collisions
function Player:movePlayer()
  --Crank controls
  local crankChange = playdate.getCrankChange()
  playerSpeed += -crankChange / 10

  local _, _, collisions, length = self:moveWithCollisions(self.x, self.y + playerSpeed)
  for i=1,length do
    local collision = collisions[i]
    local collisionType = collision.type
    if collisionType == gfx.sprite.kCollisionTypeOverlap then
        local collisionTag = collision.other:getTag()
        if collisionTag == TAGS.Collectable then
            collision.other:collect()
        elseif collisionTag == TAGS.Obstacle then
            -- Future wip
        end
    elseif collisionType == gfx.sprite.kCollisionTypeSlide then
            local collisionTag = collision.other:getTag()
            if collisionTag == TAGS.Solid then
                -- Future wip
            end
            self.touchingWall = true
        end
    end
end

-- Step event
function Player:update()
-- 
  --if self.y > self.height/2 and self.y < (viewHeight - self.height/2)  then
    self:movePlayer()
  --end
end


