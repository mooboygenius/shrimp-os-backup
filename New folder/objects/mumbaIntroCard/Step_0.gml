if live_call() return live_result;

event_inherited();

var l=.2;
angle=lerp(angle, targetAngle, l/2);
drawX=lerp(drawX, goalX, l);
drawY=lerp(drawY, goalY, l);