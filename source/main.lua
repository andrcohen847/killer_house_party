import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics

Player(30, 120)

function playdate.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end
