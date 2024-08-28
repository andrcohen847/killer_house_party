local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y)
    local playerImage = gfx.image.new("images/player")
    self:setImage(playerImage)
    self:moveTo(x, y)
    self:add()

    self.speed = 3
end

function Player:update()
    if pd.buttonIsPressed(pd.kButtonUp) then
        if self.y > 15 then
            self:moveBy(0, -self.speed)
        end
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        if self.y < 225 then
            self:moveBy(0, self.speed)
        end
    elseif pd.buttonIsPressed(pd.kButtonLeft) then
        if self.x > 15 then
            self:moveBy(-self.speed, 0)
        end
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        if self.x < 385 then
            self:moveBy(self.speed, 0)
        end
    end
end