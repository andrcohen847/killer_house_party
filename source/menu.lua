local gfx  <const> = playdate.graphics

local spriteTitle = gfx.sprite.new()
local spriteButton = gfx.sprite.spriteWithText("Press 'A' to enter the party...", 400, 240)

local imageSpriteTitle = gfx.image.new(200, 120)

gfx.setFontFamily(gfx.getFont(gfx.font.kVariantBold))

gfx.pushContext(imageSpriteTitle)
gfx.drawTextAligned("Killer House Party", 100, 60, kTextAlignment.center)
gfx.popContext()

spriteTitle:setImage(imageSpriteTitle:scaledImage(2))

spriteTitle:moveTo(200, 100)
spriteButton:moveTo(200, 170)

function ShowMenu()
    spriteTitle:add()
    spriteButton:add()
end

function HideMenu()
    spriteTitle:remove()
    spriteButton:remove()
end