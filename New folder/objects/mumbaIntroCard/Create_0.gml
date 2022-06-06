if live_call() return live_result;

event_inherited();

drawX=-999;
drawY=-999;
goalX=GAME_WIDTH div 2;
goalY=GAME_HEIGHT div 2-20;

drawScript=function(x, y) {
	defaultDrawScript(drawX, drawY);
}

targetAngle=random_range(-1, 1)*5;
targetAngle=round(targetAngle);