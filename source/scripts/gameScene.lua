local gfx <const> = playdate.graphics
local ldtk <const> = LDtk

ldtk.load("rooms/houseparty.ldtk", false)

class('GameScene').extends()

function GameScene:init()
    self:goToRoom("LivingRoom")
end

function GameScene:goToRoom(roomName)
    gfx.sprite.removeAll()

    for layerName, layer in pairs(ldtk.get_layers(roomName)) do
        if layer.tiles then
            local tilemap = ldtk.create_tilemap(roomName, layerName)

            local layerSprite = gfx.sprite.new()
            layerSprite:setTilemap(tilemap)
            layerSprite:moveTo(0, 0)
            layerSprite:setCenter(0, 0)
            layerSprite:setZIndex(layer.zIndex)
            layerSprite:add()
        end
    end
end