if live_call() return live_result;

event_inherited();

squish=lerp(squish, wave(-1, 1, 1)*.2, .3);
if place_meeting(x, y, mumbaPlayer) {
	hurt(mumbaPlayer, 1);
	instance_destroy();
}

if place_meeting(x, y+1, mumbaWall) instance_destroy();

if grace<-10 grace=2;

verticalSpeed=min(verticalSpeed, 1.5);
horizontalSpeed=lerp(horizontalSpeed, 0, .05);