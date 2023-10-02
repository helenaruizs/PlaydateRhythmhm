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

import '../toyboxes/toyboxes.lua'

import "player"

local gfx <const> = playdate.graphics
local pd <const> = playdate

local function initialize()
	Player.init(200, 120)
end

initialize()

function pd.update()
	gfx.sprite.update()
end