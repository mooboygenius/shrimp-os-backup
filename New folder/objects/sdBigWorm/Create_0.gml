if live_call() return live_result;

event_inherited();

state=0;
timer=0;

chodeShield=ds_list_create();
chodeCount=6;
chodeTime=0;
chodeRotateSpeed=1;
repeat(chodeCount) {
	ds_list_add(chodeShield, noone);
}
makeChodes=function() {
	/// @function makeChodes()
	for (var i=0; i<chodeCount; i++) {
		if !instance_exists(chodeShield[| i]) {
			var inst=instance_create_depth(x, y, depth-1, sdChode);
			with inst {
				grace=10;
				squish=1;
				horizontalSpeed=0;
				verticalSpeed=0;
				state=999;
				pointValue=0;
			}
			chodeShield[| i]=inst;
		}
	}
}
shotTimer=0;

spawnWormTimer=0;

respawnChodesTimer=0;

//hp=1;

die=function() {
	if state<2 {
		unlockMedal("Worm Annihilator");
		with sdPlayer {
			points+=other.pointValue;
			ng_postScore(11841, points);
		}
		playSound(sfxSDShotgun, 100, .8);
		timer=0;
		state=2;
		hurtPlayerOnTouch=false;
		audio_group_stop_all(bgm);
		with sdEnemy {
			if object_index!=other.object_index && object_index!=sdBossController {
				instance_destroy();
			}
		}
		with sdCloudGenerator {
			instance_destroy();
		}
		with sdSpitWormProjectile instance_destroy();
		image_speed=0;
		with game {
			cameraZoomLerp+=.2;
			cameraShake=10;
		}
		with sdBackgroundController {
			backgroundSpeed=0;
		}
	}
}

rectangleHeight=0;