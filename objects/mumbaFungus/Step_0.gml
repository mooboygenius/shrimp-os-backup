if live_call() return live_result;

event_inherited();

var px=0, py=0;
with mumbaPlayer {
	px=x;
	py=y;
}
if point_distance(x, y, px, py)<40 {
	if grace<-3 grace=1;
	squish=lerp(squish, wave(-1, 1, .2)*.1, .2);
}

if place_meeting(x, y, mumbaPlayer) {
	var d=point_direction(x, y, px, py),
	spd=4;
	with mumbaPlayer {
		horizontalKnockback=lengthdir_x(spd, d);
		verticalKnockback=lengthdir_y(spd, d);
	}
	setCameraShake(2);
	instance_destroy();
}

if place_meeting(x, y+1, mumbaWall) && sprite_index==sprMumbaFungusJump {
	horizontalSpeed=0;
	setSprite(self, sprMumbaFungusStartJump);
	createMumbaParticle(x+sprite_xoffset, y+sprite_yoffset, mumbaDustParticle);
	createMumbaParticle(x-sprite_xoffset, y+sprite_yoffset, mumbaDustParticle);
	squish=.2;
}

if place_meeting(x+horizontalSpeed, y, mumbaWall) {
	horizontalSpeed*=-1;
	xScale*=-1;
}