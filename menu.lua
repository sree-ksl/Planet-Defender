-- Corona Storyboard variables
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()


-- Require the widget class
widget = require "widget"



-- Touch event listener for the menu's background image
-- Goes to the game scene
local gotoGame = function( event )
    -- Only process the event if the player started the tap
    if event.phase == "ended" then
        storyboard.gotoScene( "game" )
    end
end



-- Called when the scene's view does not exist:

function scene:createScene( event )
    local group = self.view


    -- newBGImage
    -- Add an image to the scene
    local bgimage = display.newImage("images/menu_bg.jpg")
    bgimage.anchorX, bgimage.anchorY = 0, 0
    group:insert( bgimage )

    
    -- addListenerToMenu
    bgimage:addEventListener( "touch", gotoGame )

    
    -- useSpriteForButton
    -- Create a new sprite sheet
    menuSheets = graphics.newImageSheet( "images/menu_buttons.png", 
        { width = 120, height = 40, numFrames = 2 } )

    
    -- playButtonBuild
    -- Build a "Play" button

    local playButton = widget.newButton{

        id = "btnplay",
        label = "Play",
        labelColor = { default={ 0, 0, 0 } },
        left = 100,
        top = 200,
        width = 120, 
        height = 40,
        cornerRadius = 10,


        -- Make the button use the sprite sheet
        sheet = menuSheets,
        defaultFrame = 1,
        overFrame = 2,


        onEvent = gotoGame

    }

    group:insert( playButton )

    
end

-- Called immediately after scene has moved onscreen:
-- purgeScene
function scene:enterScene( event )

    local group = self.view
    

    storyboard.purgeScene( "gameover" )
end



-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
    local group = self.view
end


-- Add the scene event listeners
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

-- Return the scene
return scene