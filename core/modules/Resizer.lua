module("Resizer",package.seeall);

function Resizer:fitToHeight(image)
	local scaleFactor = content.height/image.height;
	image.height = image.height*scaleFactor;
	image.width = image.width*scaleFactor;
end

function Resizer:fitToWidth(image)
	local scaleFactor = content.width/image.width;
	image.height = image.height*scaleFactor;
	image.width = image.width*scaleFactor;
end