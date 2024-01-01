-- "Macros"
local pd <const> = playdate
local gfx <const> = playdate.graphics
local viewWidth <const> = 400
local viewHeight <const> = 240

class('Wall').extends(gfx.sprite)

function Wall:init(x, y, width, height)
    Wall.super.init(self)
    self:setCenter(0, 0)
    self:moveTo(x, y)
    self:setCollideRect(0, 0, width, height)
    self.collisionResponse = gfx.sprite.kCollisionTypeSlide
    self:setTag(TAGS.Solid)
    self:add()
end