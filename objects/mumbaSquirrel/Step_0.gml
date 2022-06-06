if live_call() return live_result;

if place_meeting(x, y+1, mumbaWall) && place_meeting(x+horizontalSpeed*8, y, mumbaWall) {
	createMumbaParticle(x-8, y+sprite_yoffset, mumbaDustParticle);
	createMumbaParticle(x+8, y+sprite_yoffset, mumbaDustParticle);
	verticalSpeed=-3;
	squish=-.1;
}

if place_meeting(x+horizontalSpeed, y, mumbaWall) {
	horizontalSpeed*=-1;
}

var cx=x+sign(horizontalSpeed)*16;
if place_meeting(x, y+1, mumbaWall) && !collision_line(cx, y, cx, y+48, mumbaWall, false, false) {
	verticalSpeed=-3;
	createMumbaParticle(x-sprite_xoffset, y+sprite_yoffset, mumbaDustParticle);
	createMumbaParticle(x+sprite_xoffset, y+sprite_yoffset, mumbaDustParticle);
	squish=-.2;
}

if abs(horizontalSpeed)<moveSpeed {
	horizontalSpeed=moveSpeed;
}

event_inherited();

if !place_meeting(x, y+1, mumbaWall) {
	if verticalSpeed<0 {
		setSprite(self, sprMumbaSquirrelJump);
	} else if verticalSpeed>0 {
		setSprite(self, sprMumbaSquirrelFall);
	}
} else {
	if sprite_index==sprMumbaSquirrelFall {
		squish=.2;
	}
	setSprite(self, sprMumbaSquirrelWalk)
}