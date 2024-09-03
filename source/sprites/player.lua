local pd <const> = playdate
local gfx <const> = pd.graphics
local sound <const> = pd.sound

class('Player').extends(gfx.sprite)

local spFootstep = sound.sampleplayer.new("assets/sfx/footsteps")
local playerImage = gfx.image.new("assets/images/player")


function Player:init(x, y, gameManager)
    self.gameManager = gameManager

    self:setImage(playerImage)
    self:moveTo(x, y)
    self:setZIndex(Z_Indexes.Player)
    self:setTag(TAGS.Player)
    self:add()
    self:setCollideRect(0, 0, self:getSize())

    self.xVelocity = 0
    self.yVelocity = 0
    self.maxSpeed = 3
end

function Player:update()
    self:moveWithCollisions(self.x + self.xVelocity, self.y + self.yVelocity)

    if pd.buttonIsPressed(pd.kButtonUp) then
        self.yVelocity = -self.maxSpeed
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        self.yVelocity = self.maxSpeed
    elseif pd.buttonIsPressed(pd.kButtonLeft) then
        self.xVelocity = -self.maxSpeed
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        self.xVelocity = self.maxSpeed
    elseif (playdate.buttonJustPressed(playdate.kButtonB)) and GameStarted == true then 
        self:remove()
        GameStarted = false
        ShowMenu()
    else
        self.yVelocity = 0
        self.xVelocity = 0
        spFootstep:stop()
    end

    if (self.y == 96.0 or self.y == 80.0) and self.x < 194.0 and self.x >= 188.0 and playdate.buttonJustPressed(playdate.kButtonA) then
        self.gameManager:enterRoom("north")
    elseif self.y > 180 and playdate.buttonJustPressed(playdate.kButtonA) then
        self.gameManager:enterRoom("south")
    end
end

function Player:collisionResponse()
    return gfx.sprite.kCollisionTypeFreeze
end