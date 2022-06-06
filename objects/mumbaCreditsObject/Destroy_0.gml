if live_call() return live_result;

if hp<=0 {
	setCameraShake(2);
	repeat(20) {
		createMumbaParticle(x+random_range(-1, 1)*sprite_xoffset, y+random_range(-1, 1)*sprite_yoffset, mumbaDustParticle);
	}
	
	repeat(8) {
		createMumbaParticle(x+random_range(-1, 1)*sprite_xoffset, y+random_range(-1, 1)*sprite_yoffset, mumbaConfettiParticle);
	}
	
	repeat((sprite_width+sprite_height) div 32) {
		var inst=instance_create_depth(x+random_range(-sprite_xoffset, sprite_xoffset), y+random_range(-sprite_yoffset, sprite_yoffset), depth, mumbaCoin);
		with inst {
			horizontalSpeed=random_range(-1, 1)*3;
			verticalSpeed=random_range(.2, -1)*3;
			grace=5;
		}
		with parentWindow {
			ds_list_insert(children, 0, inst);
		}
	}
}

if sprite_exists(sprite) sprite_delete(sprite);