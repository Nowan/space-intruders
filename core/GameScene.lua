local composer = require( "composer" )

local scene = composer.newScene()

local PlanetBase = require("core.modules.PlanetBase");
local SpaceShip = require("core.modules.SpaceShip");
local Gui = require("core.modules.Gui");

local physics = require("physics");

--------------------------- local declarations -----------------------------

local gameScore = 0;

--------------------------- composer functions -----------------------------


function scene:create( event )
    local sceneGroup = self.view

    gameScore=0;

    local gui = Gui.new();

    physics.start( );
    physics.setGravity( 0, 0 );
    physics.setDrawMode( "hybrid" );

    local battlefield = display.newGroup( );

    local spaceBackground = display.newImage( battlefield, "core/assets/images/space-1.jpg");
    Resizer:fitToHeight(spaceBackground);
    spaceBackground.x = content.centerX;
    spaceBackground.y = content.centerY;

    local planetBase = PlanetBase.new(gui);
    planetBase.x = content.centerX;
    planetBase.y = content.centerY;
    planetBase:initPhysics();
    battlefield:insert( planetBase );

    local function spawn()
        local spawnCountdown = math.random( 1000,2000 );
        timer.performWithDelay( spawnCountdown, function(event)
            local shipType = math.random( 2 )-1;
            local typeLetter;
            if(shipType==0) then
                shipType=SpaceShip.TYPE_POWER;
            elseif(shipType==1) then
                shipType=SpaceShip.TYPE_SPEED;
            end
            local shipDifficulty = math.random( 2 );

            local spaceShip = SpaceShip.new(shipType, shipDifficulty, gui);
            battlefield:insert( spaceShip );

            local fromTop = math.random( 2 ); -- 1 or 2
            local fromLeft = math.random( 2 ); -- 1 or 2
            spaceShip.x = ((fromLeft==1) and 0 or content.width+200)+((fromLeft==1) and -1 or 0)*math.random(500);
            spaceShip.y = ((fromTop==1) and 0 or content.height)+((fromTop==1) and -1 or 0)*math.random(500);

            spaceShip:initPhysics();

            spaceShip:attackTarget( planetBase );
            spawn();
        end, 1 );
    end
    spawn();

    sceneGroup:insert( battlefield );
    sceneGroup:insert( gui );
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