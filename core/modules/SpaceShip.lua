module(...,package.seeall);

TYPE_POWER='P';
TYPE_SPEED='S';

DIFFICULTY_LOW=1;
DIFFICULTY_MEDIUM=2;
DIFFICULTY_HARD=3;

function new(type, difficulty)
	local spaceShip = display.newContainer( 100, 100 );

	local shipHeight = 150;

	local texturePath =  "core/assets/images/spaceship-"..type.."-"..difficulty..".png";
	local shipTexture = display.newImage( spaceShip, texturePath, 0, 0 );
	Resizer:fitToHeight(shipTexture, shipHeight);
	spaceShip.width = shipTexture.width;
	spaceShip.height = shipTexture.height;

	return spaceShip;
end