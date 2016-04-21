module("Resizer",package.seeall);

function Resizer:fitToHeight(image, height)
	local targetHeight = (height==nil) and content.height or height;
	scaleFactor = image.height/targetHeight;
	image.height = image.height/scaleFactor;
	image.width = image.width/scaleFactor;
end

function Resizer:fitToWidth(image, width)
	local targetWidth = (width==nil) and content.width or width;
	local scaleFactor = image.width/targetWidth;
	image.height = image.height/scaleFactor;
	image.width = image.width/scaleFactor;
end