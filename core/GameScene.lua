local composer = require( "composer" )

local scene = composer.newScene()

--------------------------- local declarations -----------------------------


--------------------------- composer functions -----------------------------


function scene:create( event )
    local sceneGroup = self.view

    local spaceBackground = display.newImageRect( sceneGroup, "core/assets/images/space-1.jpg", cWidth, cHeight );
    spaceBackground.x = cCenterX;
    spaceBackground.y = cCenterY;

end


function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        
    elseif ( phase == "did" ) then
        
    end
end


function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        
    elseif ( phase == "did" ) then
        
    end
end



function scene:destroy( event )
    local sceneGroup = self.view

end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene