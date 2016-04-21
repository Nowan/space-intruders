module(...,package.seeall);

TYPE_POWER='P';
TYPE_SPEED='S';

DIFFICULTY_LOW=1;
DIFFICULTY_MEDIUM=2;
DIFFICULTY_HARD=3;

local function getSpeed(type, difficulty)
	local isFast = (type==TYPE_SPEED);
	local normalSpeed = 50;

	return normalSpeed*(difficulty/2)*(isFast and 2 or 1)/100;
end

local function getHealth(type, difficulty)
	local isHuge = (type==TYPE_POWER);
	local normalHealth = 50;

	return normalHealth*(difficulty)*(isHuge and 2 or 1);
end

function new(type, difficulty, gui)
	local spaceShip = display.newContainer( 100, 100 );

	-------------------------- parameters ----------------------------
	local shipHeight = 150;
	spaceShip.speed = getSpeed(type, difficulty);
	spaceShip.health = getHealth(type, difficulty);

	--------------------------- methods ------------------------------

	function spaceShip:attackTarget( target )
		--step 1: rotate ship towards the target
		local differenceX = spaceShip.x - target.x;
		local differenceY = spaceShip.y - target.y;
		local targetAngle = math.atan( differenceY/differenceX )*180/math.pi + 90;
		if(differenceX>0) then targetAngle = targetAngle+180; end
		spaceShip.rotation = targetAngle;

		--step 2: move ship towards the target
		local distance = math.sqrt( math.pow( differenceX, 2 )+math.pow( differenceY, 2 ) );
		local transisionDuration = distance/spaceShip.speed;
		spaceShip.moveTransition = transition.to(spaceShip, {x=target.x, y=target.y, time=transisionDuration});
	end

	function spaceShip:destroy()
		transition.cancel(self.moveTransition);

		physics.removeBody( self );
		timer.performWithDelay( 1000, function(event) 
			if(self==nil) then return end;
			self:removeSelf( );
			self=nil;
		end,1);
	end

	function spaceShip:initPhysics()
		physics.addBody( self, "dynamic");
		self.isSensor = true;
		self.name = "spaceShip";
	end

	------------------------ event handlers ----------------------------

	spaceShip:addEventListener( "tap", function( event )
		gameScore = gameScore+spaceShip.health;
		gui:setScoreLabel(gameScore);
	    spaceShip:destroy();
	    return true;
	end)

	------------------------- declarations -----------------------------

	local texturePath =  "core/assets/images/spaceship-"..type.."-"..difficulty..".png";
	local shipTexture = display.newImage( spaceShip, texturePath, 0, 0 );
	Resizer:fitToHeight(shipTexture, shipHeight);
	spaceShip.width = shipTexture.width;
	spaceShip.height = shipTexture.height;

	return spaceShip;
end