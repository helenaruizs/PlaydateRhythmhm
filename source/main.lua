--#region Playdate libraries
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/ui"
--#endregion

--Game objects
import "objects/player"
import "objects/wall"
import "gameData"

--#region "Macros"
local pd <const> = playdate
local gfx <const> = playdate.graphics
local viewWidth <const> = 400
local viewHeight <const> = 240
--#endregion

--Global variables
TAGS = {
	Solid = 1,
	Collectable = 2,
	Obstacle = 3,
	Player = 4,
	Destructable = 5,
	Interactable = 7,
}

COLLISION_GROUPS = {
    player = 1
}

--#region Custom Functions

local function loadGame()
	pd.display.setRefreshRate(50) -- Sets framerate to 50 fps
	math.randomseed(pd.getSecondsSinceEpoch()) -- seed for math.random
end

local function clearScreen()
	gfx.clear() -- Clears the screen
end

--#endregion

--#region Create instances
local function initialize()
    Player(20, viewHeight/2)

	--function Wall:init(x, y, width, height) - Colliders for the screen boundaries
	Wall(0, 0, 400, 1)
	Wall(0, 239, 400, 1)
end

initialize()
--#endregion


loadGame()

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
	pd.drawFPS(0,0) -- FPS widget
end