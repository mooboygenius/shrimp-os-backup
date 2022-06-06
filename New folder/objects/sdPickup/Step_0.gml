if live_call() return live_result;

// Inherit the parent event
event_inherited();

if grace<-10 grace=1;
xScale=lerp(xScale, wave(1, 1.2, 2), .2);
yScale=xScale;

if y>GAME_HEIGHT*2 {
	instance_destroy();
}

if place_meeting(x, y, sdPlayer) {
	grabScript();
}