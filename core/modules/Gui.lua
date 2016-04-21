module(...,package.seeall);

function new()
	local gui = display.newGroup( );
	
	local scoreLabel = display.newText( gui, "Score: 0", 0, 25, "Roboto", 30)
	scoreLabel:setFillColor( 1,1,1 );

	local healthLabel = display.newText( gui, "HP: 5000", content.width-40, 25, "Roboto", 30)
	scoreLabel:setFillColor( 1,1,1 );

	function gui:setScoreLabel(score)
		scoreLabel.text = "Score: "..score;
	end

	function gui:setHealthLabel(health)
		healthLabel.text = "Health: "..health;
	end

	return gui;
end