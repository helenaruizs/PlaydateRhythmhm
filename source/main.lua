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

--Levels
import "levels/level1"

--#region "Macros"
local pd <const> = playdate
local gfx <const> = playdate.graphics
--#endregion

--#region Global variables
VIEW_WIDTH = 400
VIEW_HEIGHT = 240

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

-- Beat counter
BPM = 120
BEAT_SUBDIVISION = 4
SUB_BEAT_DURATION = (60 * 1000) / (BPM * BEAT_SUBDIVISION) -- milliseconds
MAX_SUB_BEATS = 16
SUB_BEAT_COUNTER = 1
SECTION_COUNTER = 1

--#endregion


--#region Local variables
local playTimer = nil
local playTime = 8 * 1000 -- 30 seconds
--#endregion

--#region Level 1
local sec1 = {0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0}

local sec2 = {0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0}

local sec3 = {0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0}

local sec4 = {0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0}

local sec5 = {1, 0, 0, 0,   0, 0, 0, 0,   1, 0, 0, 0,   0, 0, 0, 0}

local sec6 = {1, 0, 0, 0,   0, 0, 0, 0,   1, 0, 0, 0,   0, 0, 0, 0}

local sec7 = {1, 0, 0, 0,   0, 0, 0, 0,   1, 0, 0, 0,   0, 0, 0, 0}

local sec8 = {1, 0, 0, 0,   0, 0, 0, 0,   1, 0, 0, 0,   0, 0, 0, 0}

local sec9 = {1, 0, 0, 0,   0, 0, 0, 0,   1, 0, 0, 0,   0, 0, 0, 0}

local sec10 = {0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0}

local sec11 = {0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0}

local sec12 = {0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0}

local sec13 = {0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0}

local sec14 = {0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0}

local sec15 = {0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0}

local sec16 = {0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0}

local level1sections = {sec1, sec2, sec3, sec4, sec5, sec6, sec7, sec8, sec9, sec10, sec11, sec12, sec13, sec14, sec15, sec16}
--#endregion

--#region Custom Functions

local function loadGame()
	pd.display.setRefreshRate(50) -- Sets framerate to 50 fps
	math.randomseed(pd.getSecondsSinceEpoch()) -- seed for math.random
end

local function clearScreen()
	gfx.clear() -- Clears the screen
end

local function beatCounter()
	SUB_BEAT_COUNTER += 1
	if SUB_BEAT_COUNTER > MAX_SUB_BEATS then
		SUB_BEAT_COUNTER = 1
		SECTION_COUNTER += 1
	end

	-- Check for spawn points
    local spawnY = level1sections[SECTION_COUNTER][SUB_BEAT_COUNTER]
    if spawnY ~= 0 then
        
		gfx.drawText("YAYY", 100, 150)
		--Collectable.spawn(spawnY) -- Spawn collectable at the determined Y position
    end
end


--#region Create instances
local function initialize()
	playTimer = pd.timer.new(SUB_BEAT_DURATION, beatCounter)
	playTimer.repeats = true

    Player(20, VIEW_HEIGHT/2)

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

	gfx.drawText("Sub Beat: " .. SUB_BEAT_COUNTER, 150, 5)
	gfx.drawText("Section: " .. SECTION_COUNTER, 20, 5)
	gfx.drawText("Section: " .. level1sections[5][1], 20, 50)
end