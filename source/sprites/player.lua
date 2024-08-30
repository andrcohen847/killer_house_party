local pd <const> = playdate
local gfx <const> = pd.graphics
local sound <const> = pd.sound

class('Player').extends(gfx.sprite)

local spFootstep = sound.sampleplayer.new("assets/sfx/footsteps")
local playerImage = gfx.image.new("assets/images/player")


function Player:init(x, y)
    self:setImage(playerImage)
    self:moveTo(x, y)
    self:add()

    self.speed = 3
end

function Player:update()
    if pd.buttonIsPressed(pd.kButtonUp) then
        if self.y > 15 then
            spFootstep:play(0, 1.1)
            self:moveBy(0, -self.speed)
        end
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        if self.y < 225 then
            spFootstep:play(0, 1.1)
            self:moveBy(0, self.speed)
        end
    elseif pd.buttonIsPressed(pd.kButtonLeft) then
        if self.x > 15 then
            spFootstep:play(0, 1.1)
            self:moveBy(-self.speed, 0)
        end
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        if self.x < 385 then
            spFootstep:play(0, 1.1)
            self:moveBy(self.speed, 0)
        end
    elseif (playdate.buttonJustPressed(playdate.kButtonB)) and GameStarted == true then 
        self:remove()
        GameStarted = false
        ShowMenu()
    else
        spFootstep:stop()
    end
end