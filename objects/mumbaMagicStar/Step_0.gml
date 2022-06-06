if live_call() return live_result;

event_inherited();

if life%3==0 angle+=20;

verticalKnockback=lerp(verticalKnockback, 0, .2);

xScale=wave(.9, 1.5, 1);
yScale=xScale;

createMumbaParticle(x, y+random_range(-sprite_yoffset, sprite_yoffset), mumbaMagicParticle)

if life%8==0 {
	grace=1;
	squish=.2;
	var inst=instance_create_depth(x+horizontalSpeed*2, y, depth, mumbaMagicDrop);
	with inst {
		grace=2;
		squish=-.5;
		verticalSpeed=3;
	}
	with parentWindow {
		ds_list_add(children, inst);
	}
}