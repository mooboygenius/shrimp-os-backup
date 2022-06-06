if live_call() return live_result;

if place_meeting(x, y+1, mumbaWall) {
	horizontalSpeed=lerp(horizontalSpeed, 0, .1);
	if verticalSpeed>1 {
		if verticalSpeed>3 {
			createMumbaParticle(x-sprite_xoffset, y, mumbaDustParticle);
			createMumbaParticle(x+sprite_xoffset, y, mumbaDustParticle);
			grace=4;
		}
		verticalSpeed*=-.5;
		squish=.2;
	}
	life--;
	if life<=0 {
		instance_destroy();
	}
}

event_inherited();

