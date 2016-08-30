local background = display.newImageRect( "platform.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

--loading the platform
local platform = display.newImageRect("background.png", 300, 80)
platform.x = display.contentCenterX
platform.y = display.contentHeight -25

--loading the Balloon
local balloon = display.newImageRect("balloon.png", 112,112)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 1

--adding Physics
local physics = require( "physics" )
physics.start()
physics.addBody( platform, "static" )
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )

local tapCount = 0
local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
tapText:setFillColor( 0, 0, 0 )
--function
local function pushBalloon()
    balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
    tapCount = tapCount + 1
    tapText.text = tapCount
end

--event listener
balloon:addEventListener( "tap", pushBalloon )


