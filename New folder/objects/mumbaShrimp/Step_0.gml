if live_call() return live_result;


if place_meeting(x+horizontalSpeed, y, mumbaWall) {
	horizontalSpeed*=-1;
}

if abs(horizontalSpeed)<moveSpeed {
	horizontalSpeed=moveSpeed;
}

event_inherited();

if place_meeting(x, y+1, mumbaWall) {
	verticalSpeed=-1.5;
	squish=-.1;
}

angle=wave(-1, 1, .25)*20;