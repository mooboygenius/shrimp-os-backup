if live_call() return live_result;

event_inherited();

if hp<=0 {
	playMumbaSound(sfxMumbaFungusManDeath, 100, random_range(.8, 1.2));
	repeat(6) {
		var inst=instance_create_depth(x, y, depth, mumbaFungusSpore);
		with inst {
			horizontalSpeed=random_range(-1, 1)*.7;
			verticalSpeed=random_range(-1, -3);
			grace=10;
			squish=-.6;
			weight=random_range(.05, .1);
		}
		with parentWindow {
			ds_list_add(children, inst);
		}
	}
}