if live_call() return live_result;

sprite_index=sprFilledWindowFrame;

event_inherited();

setWindowSize(self, 0, 0, 200, 160);
centerWindow(self);

audio_group_stop_all(bgm);

ds_list_add(children, instance_create_depth(0, 0, 0, DEV_MODE ? mumbaDevTool : mumbaMilkbarLadsIntro));

playerData=instance_create_depth(0, 0, 0, mumbaPlayerData);
ds_list_insert(children, 0, playerData);

cameraX=0;
cameraY=0;
cameraTargetX=0;
cameraTargetY=0;
cameraSpeed=.3;
cameraShake=0;
cameraKick=0;
cameraKickDirection=0;
cameraFocus=noone;
cameraLeftLimit=9999;
cameraRightLimit=-9999;
cameraTopLimit=9999;
cameraBottomLimit=-9999;

particleSystem=part_system_create();
part_system_depth(particleSystem, 0);
part_system_automatic_draw(particleSystem, false);

uiParticleSystem=part_system_create();
part_system_depth(uiParticleSystem, 0);
part_system_automatic_draw(uiParticleSystem, false);

globalvar mumbaDustParticle;
mumbaDustParticle=part_type_create();
part_type_sprite(mumbaDustParticle, sprMumbaDust, false, false, true);
part_type_orientation(mumbaDustParticle, 0, 360, 5, 0, false);
part_type_size(mumbaDustParticle, 1.2, 1.33, -.03, 0);
part_type_direction(mumbaDustParticle, 90, 90, 0, 10);
part_type_speed(mumbaDustParticle, .5, .6, -.01, 0);

globalvar mumbaSmokeParticle;
mumbaSmokeParticle=part_type_create();
part_type_sprite(mumbaSmokeParticle, sprMumbaSmoke, false, false, true);
part_type_orientation(mumbaSmokeParticle, 0, 360, 5, 0, false);
part_type_size(mumbaSmokeParticle, 1.2, 1.33, -.03, 0);
part_type_direction(mumbaSmokeParticle, 90, 90, 0, 10);
part_type_speed(mumbaSmokeParticle, .5, .6, -.01, 0);

globalvar mumbaExplosionParticle;
mumbaExplosionParticle=part_type_create();
part_type_sprite(mumbaExplosionParticle, sprMumbaExplosion, true, false, true);
part_type_size(mumbaExplosionParticle, .9, 1.3, -.1, .01);
part_type_life(mumbaExplosionParticle, 10, 15);

globalvar mumbaMagicParticle;
mumbaMagicParticle=part_type_create();
part_type_sprite(mumbaMagicParticle, sprMumbaMagicParticle, false, false, true);
part_type_life(mumbaMagicParticle, 10, 20);
part_type_size(mumbaMagicParticle, 1, 1, -.02, 0);
part_type_orientation(mumbaMagicParticle, 0, 360, 4, 0, false);
part_type_color_hsv(mumbaMagicParticle, 0, 255, 255, 255, 255, 255);

globalvar mumbaConfettiParticle;
mumbaConfettiParticle=part_type_create();
part_type_sprite(mumbaConfettiParticle, sprMumbaConfetti, false, false, true);
part_type_life(mumbaConfettiParticle, 300, 300);
part_type_size(mumbaConfettiParticle, 1, 2, 0, 0);
part_type_speed(mumbaConfettiParticle, 1.5, 2.5, 0, .3);
part_type_direction(mumbaConfettiParticle, 269, 271, 0, 5);
part_type_orientation(mumbaConfettiParticle, 0, 360, 2, 0, false);

globalvar mumbaRockCrumbleParticle;
mumbaRockCrumbleParticle=part_type_create();
part_type_sprite(mumbaRockCrumbleParticle, sprMumbaRockCrumble, false, false, true);
part_type_life(mumbaRockCrumbleParticle, 120, 120);
part_type_direction(mumbaRockCrumbleParticle, 45, 135, 0, 2);
part_type_gravity(mumbaRockCrumbleParticle, .1, 270);
part_type_speed(mumbaRockCrumbleParticle, .5, 3, 0, .2);
part_type_orientation(mumbaRockCrumbleParticle, 0, 360, 5, 2, false);

globalvar mumbaCinderParticle;
mumbaCinderParticle=part_type_create();
part_type_sprite(mumbaCinderParticle, sprMumbaCinder, false, false, true);
part_type_direction(mumbaCinderParticle, 90, 90, 0, 5);
part_type_life(mumbaCinderParticle, 240, 300);
part_type_orientation(mumbaCinderParticle, 0, 360, 3, false, false);
part_type_speed(mumbaCinderParticle, .5, 1, 0, .2);
part_type_size(mumbaCinderParticle, 1, 1.3, -.005, 0);

globalvar mumbaSnowParticle;
mumbaSnowParticle=part_type_create();
part_type_sprite(mumbaSnowParticle, sprMumbaSnowFlake, false, false, true);
part_type_direction(mumbaSnowParticle, 265, 265, 0, 5);
part_type_life(mumbaSnowParticle, 720, 840);
part_type_orientation(mumbaSnowParticle, 0, 360, 3, false, false);
part_type_speed(mumbaSnowParticle, .5, 1, 0, .2);
part_type_size(mumbaSnowParticle, 1, 1.3, 0, 0);

globalvar mumbaBulletParticle;
mumbaBulletParticle=part_type_create();
part_type_sprite(mumbaBulletParticle, sprMumbaBulletCasing, false, false, true);
part_type_direction(mumbaBulletParticle, 0, 360, 0, 5);
part_type_orientation(mumbaBulletParticle, 0, 360, 12, 0, false);
part_type_speed(mumbaBulletParticle, 3, 5, 0, 0);
part_type_gravity(mumbaBulletParticle, .2, 270);
part_type_life(mumbaBulletParticle, 180, 180);

globalvar mumbaBulletUIParticle;
mumbaBulletUIParticle=part_type_create();
part_type_sprite(mumbaBulletUIParticle, sprMumbaBulletCasingUI, false, false, true);
part_type_direction(mumbaBulletUIParticle, 130, 140, 0, 0);
part_type_speed(mumbaBulletUIParticle, 1, 3, 0, 0);
part_type_orientation(mumbaBulletUIParticle, 0, 360, 12, 0, false);
part_type_gravity(mumbaBulletUIParticle, .15, 270);
part_type_life(mumbaBulletUIParticle, 180, 180);

globalvar mumbaStarParticle;
mumbaStarParticle=part_type_create();
part_type_sprite(mumbaStarParticle, sprMumbaStarEffect, false, false, true);
part_type_direction(mumbaStarParticle, 60, 120, 0, 0);
part_type_speed(mumbaStarParticle, 3, 3, 0, 0);
part_type_gravity(mumbaStarParticle, .2, 270);
part_type_orientation(mumbaStarParticle, 0, 360, 10, 2, 0);
part_type_size(mumbaStarParticle, 1.2, 1.4, -.01, .3);

globalvar mumbaStarSmallParticle;
mumbaStarSmallParticle=part_type_create();
part_type_sprite(mumbaStarSmallParticle, sprMumbaStarEffect, false, false, true);
part_type_direction(mumbaStarSmallParticle, 60, 120, 0, 0);
part_type_speed(mumbaStarSmallParticle, 2.5, 3.5, 0, 0);
part_type_gravity(mumbaStarSmallParticle, .2, 270);
part_type_orientation(mumbaStarSmallParticle, 0, 360, 10, 2, 0);
part_type_size(mumbaStarSmallParticle, .2, .4, 0, .05);

handleChildren=function() {
	/// @function handleChildren()
	if ds_exists(children, ds_type_list) {
		for (var i=0; i<ds_list_size(children); i++) {
			with children[| i] {
				visible=false;
				parentWindow=other;
			}
			if !instance_exists(children[| i]) {
				//show_debug_message(concat("cleared #", i, " from children objects list, instance was deleted"));
				ds_list_delete(children, i);
			}
		}
	}
}

childrenSurfaceX=0;
childrenSurfaceY=0;

drawFPS=false;