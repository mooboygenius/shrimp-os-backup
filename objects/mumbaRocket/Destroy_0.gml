if live_call() return live_result;

event_inherited();

var inst=instance_create_depth(x, y, -500, mumbaExplosion);
var xo=0;
with inst {
	xo=sprite_xoffset+16;
	x=other.x;
	y=other.y;
	xstart=x;
	ystart=y;
}

with parentWindow {
	ds_list_add(children, inst);
}

setCameraShake(3);

repeat(20) {
	var l=random(xo),
	d=random(360);
	createMumbaParticle(x+lengthdir_x(l, d), y+lengthdir_y(l, d), mumbaExplosionParticle);
}
repeat(10) {
	var l=random(xo),
	d=random(360);
	createMumbaParticle(x+lengthdir_x(l, d), y+lengthdir_y(l, d), mumbaDustParticle);
}

repeat(6) {
	var l=random(4),
	d=random(360);
	createMumbaParticle(x+lengthdir_x(l, d), y+lengthdir_y(l, d), mumbaDustParticle);
}