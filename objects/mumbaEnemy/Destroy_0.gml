if live_call() return live_result;

if hp<=0 {
	playMumbaSound(choose(sfxMumbaEnemyDeath1, sfxMumbaEnemyDeath2, sfxMumbaEnemyDeath3), 10, random_range(.8, 1.1));
	
	with mumbaRealLevel {
		enemiesKilled++;
	}
	
	with mumbaPlayer {
		killCoolDown=60;
		show_debug_message("kill cooldown set");
	}
	if chance(moneyChance) {
		repeat(value) {
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
	setCameraShake(3);
	var corpse=instance_create_depth(x, y, depth+10, mumbaCorpse);
	with corpse {
		image_xscale=other.image_xscale;
		image_yscale=other.image_yscale;
		sprite_index=other.corpseSprite;
		mask_index=sprite_index;
		grace=8;
		squish=.2;
		horizontalSpeed=other.horizontalKnockback*2;
		verticalSpeed=-abs(horizontalSpeed)*random_range(.9, 1.1);
		while place_meeting(x, y, mumbaWall) y--;
	}
	with parentWindow {
		ds_list_add(children, corpse);
	}
	
	createMumbaParticle(x, y, mumbaStarParticle);
	repeat(irandom_range(4, 6)) createMumbaParticle(x, y, mumbaStarSmallParticle);
}