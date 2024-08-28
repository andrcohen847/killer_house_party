import "CoreLibs/object"

local myCounter = 0

function playdate.update()
    playdate.graphics.clear()

    myCounter += 1
    playdate.graphics.drawText("KILLER HOUSE PARTY ", 60, 110);
end
