if live_call() return live_result;

event_inherited();
while place_meeting(x, y, mumbaWall) {
	y--;
}

var p=48,
left=p,
right=left;
with mumbaLevel {
	right=tileSurfaceWidth-p;
}

if x<=left {
	sprite_index=sprMumbaDangerLeft;
	x=left;
} else if x>=right {
	sprite_index=sprMumbaDangerRight;
	x=right;
} else {
	sprite_index=sprMumbaDangerUp;
}