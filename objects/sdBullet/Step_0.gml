if live_call() return live_result;

event_inherited();

angle=point_direction(0, 0, horizontalSpeed, verticalSpeed);
if x!=clamp(x, -sprite_xoffset, GAME_WIDTH+sprite_xoffset) || y!=clamp(y, -sprite_yoffset, GAME_HEIGHT+sprite_yoffset) {
	instance_destroy();
}

var inst=instance_place(x, y, sdEnemy);
if inst {
	instance_destroy();
	with inst {
		getHurt(other.damage);
	}
	part_particles_create(sdPartSystem, x, y, sdDamagePart, 1);
	shakeCamera(1.5);
}

if bulletsFollowPlayer {
	with sdPlayer {
		other.x=x+other.xOffset;
	}
}