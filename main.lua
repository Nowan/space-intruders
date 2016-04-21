
content = {};
content.width = display.contentWidth;
content.height = display.contentHeight;
content.centerX = display.contentCenterX;
content.centerY = display.contentCenterY;

require("core.modules.Resizer")

local composer=require("composer");

composer.gotoScene("core.GameScene");