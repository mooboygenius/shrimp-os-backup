if live_call() return live_result;

if ds_list_size(waves)>0 {
	switch state {
		case 0:
			with sdBackgroundController {
				backgroundSpeed=.25;
			}
			timer++;
			if timer>30 {
				timer=0;
				state=1;
				text=concat("ROUND ", roundNumber, "\n ");
			}
			if DEV_MODE && input(vk_f1, PRESS) {
				state++;
				timer=180;
			}
		break;
		
		case 1:
			timer++;
			showText=false;
			if timer%2==0 || timer>30 {
				showText=true;
			}
			if timer>90 {
				audio_sound_gain(music, 1, 0);
				if !audio_is_playing(music) playMusic(music);
				timer=0;
				text+="START ";
				state=2;
				shakeCamera(2);
				with sdBackgroundController {
					backgroundSpeed=other.backgroundSpeed;
				}
				with game {
					cameraZoomLerp+=.1;
				}
			}
			if DEV_MODE && input(vk_f1, PRESS) {
				state++;
				timer=180;
			}
		break;
		
		case 2:
			timer++;
			if timer>60 {
				showText=timer%2==0;
				if timer>90 {
					timer=0;
					showText=false;
					state=3;
				}
			}
			if DEV_MODE && input(vk_f1, PRESS) {
				state++;
				timer=180;
				showText=false;
			}
		break;
		
		case 3:
			arrangeWaves(currentWave);
			state=4;
		break;
		
		case 4:
			var exists=false;
			
			for (var i=0; i<ds_list_size(waves); i++) {
				for (var r=0; r<ds_list_size(waves[| i]); r++) {
					var enemies=waves[| i][| r][? "enemies"];
					for (var e=0; e<ds_list_size(enemies); e++) {
						if instance_exists(enemies[| e]) && enemies[| e].active {
							exists=true;
							break;
						}
					}
					
					if exists break;
				}
				
				if exists break;
			}
			
			if !exists {
				show_debug_message(concat("wave ", currentWave, " complete"));
				currentWave++;
				state=currentWave>=ds_list_size(waves) ? 5 : 3;
				if state==5 {
					shakeCamera(5);
					with game {
						cameraZoomLerp-=.2;
					}
					if medalString!="" unlockMedal(medalString);
					text="ROUND COMPLETE";
					show_debug_message("LEVEL COMPLETE");
					audio_sound_gain(music, 0, 1000);
					with sdBackgroundController {
						backgroundSpeed=.25;
					}
				}
			}
		break;
		
		case 5:
			timer++;
			if timer>60 {
				timer=0;
				state=6;
				playMusic(bgmSDVictory, false);
				with sdEnemy instance_destroy();
			}
		break;
		
		case 6:
			timer++;
			showText=false;
			if timer>30 || timer%2==0 showText=true;
			if timer>90 {
				timer=0;
				state=7;
			}
		break;
		
		case 7:
			if !audio_is_playing(bgmSDVictory) {
				timer++;
				showText=timer%2==0;
				if timer>30 {
					showText=false;
					timer=0;
					state=8;
				}
			}
		break;
		
		case 8:
			timer++;
			if timer>60 {
				timer=0;
				instance_destroy();
				instance_create_depth(0, 0, 0, nextRound);
				state=9;
			}
		break;
	}
}

if showText {
	with sdPlayer {
		if surface_exists(uiSurface) {
			surface_set_target(uiSurface);
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(shrimpDefenderFont);
			var tx=GAME_WIDTH div 2,
			ty=GAME_HEIGHT div 2,
			t=other.text;
			draw_text(tx, ty, t);
			surface_reset_target();
		}
	}
}