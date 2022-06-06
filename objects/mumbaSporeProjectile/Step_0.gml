if live_call() return live_result;

if place_meeting(x, y+verticalSpeed, mumbaWall) && verticalSpeed>0 {
	life=0;
}

horizontalSpeed=lerp(horizontalSpeed, sign(horizontalSpeed)*.1, .002);

verticalSpeed=min(verticalSpeed, 1);
verticalKnockback=lerp(verticalKnockback, 0, .05);
event_inherited();