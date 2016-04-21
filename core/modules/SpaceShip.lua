module(...,package.seeall);

TYPE_POWER='P';
TYPE_SPEED='S';

DIFFICULTY_LOW=1;
DIFFICULTY_MEDIUM=2;
DIFFICULTY_HARD=3;

function new(type, difficulty)
	local spaceShip = display.newContainer( 100, 100 );

	-------------------------- parameters ------------------------------
	local shipHeight = 150;
	spaceShip.target = nil;

	--------------------------- methods ------------------------------

	function spaceShip:attackTarget( target )
		--step 1: rotate ship towards the target
		local differenceX = spaceShip.x - target.x;
		local differenceY = spaceShip.y - target.y;
		local targetAngle = math.atan( differenceY/differenceX )*180/math.pi + 90;
		spaceShip.rotation = targetAngle;
	end

	------------------------- declarations -----------------------------

	local texturePath =  "core/assets/images/spaceship-"..type.."-"..difficulty..".png";
	local shipTexture = display.newImage( spaceShip, texturePath, 0, 0 );
	Resizer:fitToHeight(shipTexture, shipHeight);
	spaceShip.width = shipTexture.width;
	spaceShip.height = shipTexture.height;



	return spaceShip;
end