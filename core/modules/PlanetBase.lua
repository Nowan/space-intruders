module(...,package.seeall);

function new()
	local planetContainer = display.newContainer( 100, 100 );

	local planetSize = 280;

	planetContainer.width = planetSize;
	planetContainer.height = planetSize;

	local planetTexture = display.newImage( planetContainer, "core/assets/images/planet-1.png",0,0);
	Resizer:fitToHeight(planetTexture,planetContainer.height);

	return planetContainer;
end