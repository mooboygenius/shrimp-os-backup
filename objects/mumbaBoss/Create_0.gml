if live_call() return live_result;

// Inherit the parent event
event_inherited();

hp=400;
maximumHp=hp;
//hp=50;
setSizeToHp=false;

eyes=ds_list_create();

createEye=function(ol, oa, size) {
	/// @function createEye(offsetLength, offsetAngle, size)
	var inst=instance_create_depth(x, y, depth-10, mumbaEyeBallBoss);
	with inst {
		offsetAngle=oa;
		offsetLength=ol;
		image_xscale=size;
		image_yscale=image_xscale;
	}
	with mumbaWindow ds_list_add(children, inst);
	ds_list_add(eyes, inst);
}

floorY=0;
centerX=0;
with mumbaLevel {
	other.floorY=tileSurfaceHeight-16;
	other.centerX=tileSurfaceWidth div 2;
}
while instance_position(centerX, floorY, mumbaWall) {
	show_debug_message(concat("wall at y ", floorY));
	floorY-=8;
}
hoverY=floorY-128;

lerpRate=.4;
drawShake=2;
waveMultiplier=5;
drawScript=function(x, y) {
	var m=waveMultiplier;
	setWaveShader(m, m, 10/m, 10/m, (gameFrame div 3*5)*10);
	var s=drawShake*2+8;
	draw_sprite_ext(sprite_index, image_index, x+random_range(-s, s), y+random_range(-s, s), xScale*image_xscale+squish, yScale*image_yscale-squish, angle, c_white, .5);
	defaultDrawScript(x+random_range(-drawShake,drawShake), y+random_range(-drawShake, drawShake));
	shader_reset();
}

state=0;
timer=0;
attackTime=240;
currentAttack=0;

rollTurnSpeed=0;
rollDirection=1;
image_xscale=0;
image_yscale=0;