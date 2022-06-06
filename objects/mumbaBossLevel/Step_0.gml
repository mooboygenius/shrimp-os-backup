if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		with mumbaPlayer {
			if canControl {
				other.timer++;
			}
		}
		if timer>180 {
			ds_list_add(children, instance_create_depth(tileSurfaceWidth div 2, tileSurfaceHeight div 2, -10, mumbaEyeBallLookingAtPlayer));
			playMumbaSound(sfxMumbaLand, 100, random_range(.7, .8));
			setCameraShake(2);
			state=1;
			timer=0;
			blinks=0;
		}
	break;
	
	case 1:
		timer++;
		if timer>120 {
			if timer%15==0 {
				with mumbaEyeBall squish=1;
				playMumbaSound(sfxMumbaLand, 100, random_range(1.4, 1.6));
				blinks++;
				if blinks>=2 {
					state=2;
					timer=0;
				}
			}
		}
	break;
	
	case 2:
		timer++;
		if timer>60 {
			timer=0;
			state=3;
		}
	break;
	
	case 3:
		timer++;
		if timer%30==0 {
			playMumbaSound(sfxMumbaLand, 100, random_range(.7, .8));
			var px=irandom(tileSurfaceWidth),
			py=irandom(tileSurfaceHeight div 2);
			with mumbaPlayer {
				var d=random(360),
				l=random_range(48, 160);
				px=x+lengthdir_x(l, d);
				py=y+lengthdir_y(l, d);
			}
			var inst=instance_nearest(px, py, mumbaEyeBall),
			n=0;
			while inst && point_distance(px, py, inst.x, inst.y)<20 && n<16 {
				py++;
				n++
			}
			
			var inst=instance_create_depth(px, py, -10, mumbaEyeBallLookingAtPlayer);
			with inst {
				image_xscale=random_range(.4, .8);
				image_yscale=image_xscale
			}
			ds_list_add(children, inst);
		}
		if !audio_is_playing(sfxMumbaRumble) playMumbaSound(sfxMumbaRumble);
		if gameFrame%5==0 setCameraShake(1);
		if timer>180 {
			timer=0;
			state=4;
		}
	break;
	
	case 4:
		with mumbaEyeBall {
			if chance(.005) {
				squish=1;
				playMumbaSound(sfxMumbaLand, 100, random_range(1.5, 1.7));
			}
		}
		timer++;
		if timer>180 {
			timer=0;
			state=5;
		}
	break;
	
	case 5:
		setCameraShake(2);
		if !audio_is_playing(sfxMumbaRumble) playMumbaSound(sfxMumbaRumble, 100, .8);
		timer++;
		
		if timer%4==0 {
			var px=irandom(tileSurfaceWidth),
			py=irandom_range(mumbaPlayer.y-128, tileSurfaceHeight div 2+80);
			var inst=instance_nearest(px, py, mumbaEyeBall);
			var n=0;
			while inst && point_distance(px, py, inst.x, inst.y)<10 && n<16 {
				py++;
				n++;
			}
			playMumbaSound(sfxMumbaLand, 100, random_range(1.2, 1.8));
			var inst=instance_create_depth(px, py, -10, mumbaEyeBallLookingAtPlayer);
			with inst {
				image_xscale=random_range(.4, .8);
				image_yscale=image_xscale
			}
			ds_list_add(children, inst);
		}
		
		if timer>300 {
			timer=0;
			state=6;
		}
	break;
	
	case 6:
		timer++;
		var t=180;
		if timer>t {
			if !audio_is_playing(sfxMumbaRumble) playMumbaSound(sfxMumbaRumble, 100, .6);
			setCameraShake(3);
			if timer>t+15 {
				playSound(sfxMumbaLoudExplosion);
				setCameraShake(5);
				timer=0;
				state=7;
				whiteFlash=instance_create_depth(0, 0, -10000, mumbaBossWhiteFlash);
				freakyBack=instance_create_depth(0, 0, 0, mumbaBossBackground);
				bigMumbaHead=instance_create_depth(tileSurfaceWidth div 2, tileSurfaceHeight div 2+48, -100, mumbaBigMumbaHead);
				with bigMumbaHead {
					verticalSpeed=-.3;
				}
				ds_list_add(children, whiteFlash, freakyBack, bigMumbaHead);
				with mumbaEyeBall {
					instance_destroy();
				}
				with back1 {
					instance_destroy();
				}
				with parentWindow {
					ds_list_add(children, other.whiteFlash);
				}
				with mumbaPlayer {
					x=other.tileSurfaceWidth div 2;
				}
				playMumbaMusic(bgmMumbaBoss);
			}
		}
	break;
	
	case 7:
		setCameraShake(2);
		if !instance_exists(mumbaBigMumbaHead) {
			state=8;
			setCameraShake(8);
		}
	break;
	
	case 8:
		if gameFrame%5==0 setCameraShake(1);
		if !instance_exists(mumbaBoss) {
			stopMumbaMusic();
			unlockMedal("Ugby Mumba Gamer Extreme");
			won=true;
			state=9;
		}
	break;
	
	case 9:
	break;
}