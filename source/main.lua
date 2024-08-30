import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "sprites"
import "menu"
import "scripts/libraries/ldtk.lua"

import "scripts/gameScene"

local pd <const> = playdate
local gfx <const> = pd.graphics

GameStarted = false

local function init()
    ShowMenu()
end

function playdate.update()
    gfx.sprite.update()

    if (playdate.buttonJustPressed(playdate.kButtonA)) and GameStarted == false then 
        HideMenu()
        GameStarted = true
        GameScene()
        Player(200, 120)
    end

    pd.timer.updateTimers()
end

init()
