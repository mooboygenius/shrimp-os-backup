if live_call() return live_result;
x=-999;
y=-999;

switch state {
	case 0:
		timer++;
		if timer>60 {
			timer=0;
			state=1;
		}
	break;
	
	case 1:
		if !audio_is_playing(sfxRumble) playSound(sfxRumble, 100, .8);
		shakeCamera(2);
		timer++;
		if timer>120 {
			timer=0;
			state=2;
			audio_stop_sound(sfxRumble);
			playSound(sfxSDExplosion);
		}
	break;
	
	case 2:
		shakeCamera(4);
		circleRadius++;
		circleRadius*=1.5;
		timer++;
		if timer>30 {
			timer=0;
			circleRadius=GAME_WIDTH*4;
			state=3;
		}
	break;
	
	case 3:
		timer++;
		if timer>60 {
			with sdBackgroundController {
				backgroundSpeed=3;
			}
			state=4;
			playMusic(bgmSDBoss);
			instance_create_depth(GAME_WIDTH div 2, 32, -10, sdBigWorm);
			timer=0;
		}
	break;
	
	case 4:
		circleRadius*=.7;
		circleRadius--;
		if circleRadius<=0 {
			circleRadius=0;
			state=5;
		}
	break;
}

with sdPlayer {
	if surface_exists(uiSurface) {
		surface_set_target(uiSurface);
		draw_circle_color(GAME_WIDTH div 2, 0, other.circleRadius, WHITE_COLOR, WHITE_COLOR, false);
		surface_reset_target();
	}
}