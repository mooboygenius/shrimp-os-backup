if live_call() return live_result;

if hp<=0 {
	with mumbaRealLevel {
		enemiesKilled++;
	}
	
	with mumbaPlayer {
		killCoolDown=120;
		show_debug_message("kill cooldown set");
	}
	
	if chance(1) {
		repeat(1) {
			var inst=instance_create_depth(x, y, depth-10, mumbaCoin);
			with inst {
				horizontalSpeed=other.horizontalKnockback*random_range(1.5, 2);
				verticalSpeed=-abs(horizontalSpeed)*random_range(2, 3);
				grace=5;
				squish=.5;
			}
			with parentWindow {
				ds_list_add(children, inst);
			}
		}
	}
	setCameraShake(8);
	var corpse=instance_create_depth(x, y, depth+10, mumbaBossDead);
	with parentWindow {
		ds_list_add(children, corpse);
	}
	
	with mumbaEyeBall {
		instance_destroy();
	}
}

if ds_exists(ds_type_list, eyes) {
	ds_list_destroy(eyes);
}