-- Corona Storyboard variables
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()


-- Require the widget class
widget = require "widget"



-- Touch event listener for the menu's background image
-- Goes to the menu scene
local gotoMenu = function( event )
    -- Only process the event if the player started the tap
    if event.phase == "ended" then
        storyboard.gotoScene( "menu" )
    end
end



-- gameOverScene
-- Menu listener function. Add a touch listener to the image
function addMenuListener( event )
    bgimage:addEventListener( "touch", gotoMenu )
end

-- Add an image during the scene creation process
function scene:createScene( event )
    local group = self.view

    -- Add a background image to the game over scene
    bgimage = display.newImage( "images/game_over.jpg" )
    bgimage.anchorX, bgimage.anchorY = 0, 0
    group:insert( bgimage )
    
end



-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view
    
    -- addListenerWithDelay
    -- Add a tap event listener to return to the menu
    --   but only after some time, to avoid accidental returning
    timer.performWithDelay( 500, addMenuListener )

    
    -- purgeGame
    -- If we come from the game, purge the previous scene
    storyboard.purgeScene( "game" )

    
end

-- Called when scene is about to move offscreen:

function scene:exitScene( event )
    bgimage:removeEventListener( "touch", gotoMenu )

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