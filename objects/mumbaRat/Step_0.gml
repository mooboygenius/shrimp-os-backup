if live_call() return live_result;

event_inherited();

if place_meeting(x, y+1, mumbaWall) && place_meeting(x+horizontalSpeed*8, y, mumbaWall) {
	createMumbaParticle(x-8, y+sprite_yoffset, mumbaDustParticle);
	createMumbaParticle(x+8, y+sprite_yoffset, mumbaDustParticle);
	verticalSpeed=-3;
	squish=-.1;
}

var m=1;
if !place_meeting(x, y+1, mumbaWall) {
	m=.66;
} else {
	touchedGround=true;
}
if place_meeting(x+xScale, y, mumbaWall) {
	xScale*=-1;
}

horizontalSpeed=moveSpeed*sign(xScale)*m*touchedGround;