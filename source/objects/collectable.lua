
local pd <const> = playdate
local gfx <const> = playdate.graphics

class('Collectable').extends(gfx.sprite)

local collectableSpeed = 2

function Collectable:init(x, y)
    local collectableImage = gfx.image.new("images/collectable1")
    self:setImage(collectableImage)
    self:setSize(collectableImage:getSize())
    self:setCenter(0, 0)
    self:moveTo(x, y)
    self:setCollideRect(0, 0, self.width -5, self.height)
    self.collisionResponse = gfx.sprite.kCollisionTypeOverlap

    self:setTag(TAGS.Collectable)

    self:add()
end
