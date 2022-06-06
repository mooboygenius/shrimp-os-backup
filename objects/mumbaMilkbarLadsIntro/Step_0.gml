if live_call() return live_result;

event_inherited();

var t1=.08, t2=.72, t3=1.26, t4=1.75, t5=4,
at=audio_sound_get_track_position(currentMumbaMusic);

var doThing=function() {
	squish=random_range(-1, 1)*.5;
	var a=angle;
	angle=irandom(20);
	if a>0 angle*=-1;
	state++;
	shake+=2;
}

switch state {
	case 0:
		audio_group_stop_all(bgm);
		timer++;
		if timer>30 {
			timer=0;
			state=1;
			playMumbaMusic(bgmMumbaMilkbarLadsIntro, false);
		}
	break;
	
	case 1:
		if at>=t1 {
			image_xscale=1.5;
			image_yscale=image_xscale;
			doThing();
			angle=0;
		}
	break;
	
	case 2:
		var l=.5;
		image_xscale=lerp(image_xscale, 1, l);
		image_yscale=lerp(image_yscale, 1, l);
		if at>=t2 {
			sprite_index=sprMumbaMilkbarLadsLogo1;
			doThing();
			image_xscale=1;
			image_yscale=1;
		}
	break;
	
	case 3:
		if at>=t3 {
			sprite_index=sprMumbaMilkbarLadsLogo2;
			doThing();
		}
	break;
	
	case 4:
		if at>=t4 {
			sprite_index=sprMumbaMilkbarLadsLogo3;
			doThing();
			angle=0;
			squish=.5;
			shake=4;
			image_xscale=1.5;
			image_yscale=image_xscale;
		}
	break;
	
	case 5:
		var l=.3;
		image_xscale=lerp(image_xscale, 1, l);
		image_yscale=image_xscale;
		if at>=t5 {
			image_xscale=1;
			image_yscale=1;
			state++;
		}
	break;
	
	case 6:
		image_yscale=lerp(image_yscale, 0, .6);
		timer++;
		if timer>30 {
			state=7;
			timer=0;
			circleTransition=instance_create_depth(0, 0, -1000, mumbaCircleTransition);
			with parentWindow {
				ds_list_add(children, other.circleTransition);
			}
			with circleTransition {
				circleSize=0;
				circleChange=0;
				circleX=other.drawX;
				circleY=other.drawY;
				destroyAtSize=GAME_WIDTH*2;
			}
		}
	break;
	
	case 7:
		timer++;
		if timer>30 {
			var inst=instance_create_depth(0, 0, -10, mumbaTitleController);
			with parentWindow {
				ds_list_insert(children, 0, inst);
			}
			timer=0;
			state=8;
		}
	break;
	
	case 8:
		timer++;
		if timer>10 {
			instance_destroy();
			with circleTransition {
				circleChange=8;
			}
		}
	break;
}

shake=lerp(shake, 0, .1);