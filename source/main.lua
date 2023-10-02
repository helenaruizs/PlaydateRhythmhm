import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/animation"
import "CoreLibs/animator"
import "CoreLibs/object"
import "CoreLibs/ui"
import "CoreLibs/math"
import "CoreLibs/timer"
import "CoreLibs/frameTimer"
import "CoreLibs/crank"

local gfx <const> = playdate.graphics
local pd <const> = playdate

local gridview = pd.ui.gridview.new(32, 32)

gridview:setNumberOfColumns(8)
gridview:setNumberOfRows(6)

local gridviewSprite = gfx.sprite.new()
gridviewSprite:setCenter(0, 0)
gridviewSprite:moveTo(100, 70)
gridviewSprite:add()

function pd.update()
	if pd.buttonJustPressed(pd.kButtonUp) then
		gridview:selectPreviousRow(true)
	elseif pd.buttonJustPressed(pd.kButtonDown) then
		gridview:selectNextRow(true)
	elseif pd.buttonJustPressed(pd.kButtonLeft) then
		gridview:selectPreviousColumn(false)
	elseif pd.buttonJustPressed(pd.kButtonRight) then
		gridview:selectNextColumn(false)
	end

	local gridViewImage = gfx.image.new(200, 100)
	gfx.pushContext(gridViewImage)
		gridview:drawInRect(100, 70, 200, 100)
	gfx.popContext()
	gridviewSprite:setImage(gridViewImage)

	gfx.sprite.update()
	pd.timer.updateTimers()
	pd.drawFPS(0,0) -- FPS widget
end