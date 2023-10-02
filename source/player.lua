local gfx <const> = playdate.graphics
local pd <const> = playdate

class('Player').extends(gfx.sprite)

function Player:init()
    local placeholderRadius = 16
    local playerImage = gfx.image.new(placeholderRadius * 2, placeholderRadius * 2)
    gfx.pushContext(playerImage)
        gfx.fillCircleAtPoint(placeholderRadius, placeholderRadius, placeholderRadius)
    gfx.popContext()
    self:setImage(playerImage)
    self:moveTo(x, y)
    self:add()
end