if live_call() return live_result;


if place_meeting(x+horizontalSpeed, y, mumbaWall) {
	horizontalSpeed*=-1;
}

if abs(horizontalSpeed)<moveSpeed {
	horizontalSpeed=moveSpeed;
}

event_inherited();