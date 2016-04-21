module(...,package.seeall);

function new(gui)
	local planetContainer = display.newContainer( 100, 100 );

	------------------------- parameters -----------------------------
	local planetSize = 280;
	local maxHealth = 5000;
	local currentHealth = maxHealth;

	--------------------------- methods ------------------------------

	function planetContainer:initPhysics()
		physics.addBody( self, "static", {radius=planetSize/2} );
		self.name="planetBase";

		self:addEventListener( "collision", function(event)
	        if ( event.phase == "began" and event.other.name=="spaceShip") then
	        	currentHealth = currentHealth - event.other.health;
	        	gui:setHealthLabel(currentHealth);
	        	timer.performWithDelay( 1, function() event.other:destroy(); end,1 );
	        end
        end );
	end

	---------------------- init display objects ----------------------

	planetContainer.width = planetSize;
	planetContainer.height = planetSize;

	local planetTexture = display.newImage( planetContainer, "core/assets/images/planet-1.png",0,0);
	Resizer:fitToHeight(planetTexture,planetContainer.height);

	------------------------- animations -----------------------------

	-- rotate planet
	function planetTexture:startRotation()
		self.rotation=0;
		planetTexture.rTransition = transition.to(self, {rotation=360,onComplete = self.startRotation,time=20000});
	end

	function planetTexture:stopRotation()
		transition.cancel(planetTexture.rTransition);
		planetTexture.rTransition = nil;
	end

	planetTexture:startRotation();

	return planetContainer;
end