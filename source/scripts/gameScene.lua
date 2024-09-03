local gfx <const> = playdate.graphics
local ldtk <const> = LDtk

TAGS = {
    Player = 1
}

Z_Indexes = {
    Player = 100
}

ldtk.load("rooms/world.ldtk", false)

class('GameScene').extends()

function GameScene:init()
    self:goToRoom("LivingRoom")
    self.spawnX = 200
    self.spawnY = 120

    self.player = Player(self.spawnX, self.spawnY, self)
end

function GameScene:resetPlayer()
    self.player:moveTo(self.spawnX, self.spawnY)
end

function GameScene:enterRoom(direction)
    local room = ldtk.get_neighbours(self.roomName, direction)[1]
    self:goToRoom(room)   
    self.player:add()
    local spawnX, spawnY
    if direction == "north" then
        spawnX, spawnY = self.player.x, 190
    elseif direction == "south" then
        spawnX, spawnY = self.player.x, 100
    end
    self.player:moveTo(spawnX, spawnY)
    self.spawnX = spawnX
    self.spawnY = spawnY
end

function GameScene:goToRoom(roomName)
    gfx.sprite.removeAll()

    self.roomName = roomName
    for layerName, layer in pairs(ldtk.get_layers(roomName)) do
        if layer.tiles then
            local tilemap = ldtk.create_tilemap(roomName, layerName)

            local layerSprite = gfx.sprite.new()
            layerSprite:setTilemap(tilemap)
            layerSprite:moveTo(0, 0)
            layerSprite:setCenter(0, 0)
            layerSprite:setZIndex(layer.zIndex)
            layerSprite:add()

            local floorTiles = ldtk.get_tileIDs(roomName, 'Floor', layerName)
            if floorTiles  then
                gfx.sprite.addWallSprites(tilemap, floorTiles)
            end
        end
    end
end