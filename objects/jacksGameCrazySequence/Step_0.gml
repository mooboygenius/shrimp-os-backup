if live_call() return live_result;

switch state {
	case 0:
		timer++;
		if timer>180 {
			timer=0;
			state=1;
			saveGame();
		}
	break;
	
	case 1:
		with game {
			applicationSurfaceShake=other.shakeAmount;
		}
		if !audio_is_playing(sfxRumble) playSound(sfxRumble, 100, .8);
		timer++;
		if timer%openWindowFrequency==0 {
			windowsOpened++;
			playSound(sfxGiggle, 100, laughPitch+random_range(-.2, .2));
			var win=instance_create_depth(x, y, depth-10, jacksGameFunnyWormWindow);
			with win {
				sprite=choose(sprJacksGameWorm1, sprJacksGameWorm2, sprJacksGameWorm3, sprJacksGameWorm4, sprJacksGameWorm5, sprJacksGameWorm6);
				setWindowSize(self, irandom(GAME_WIDTH), irandom(GAME_HEIGHT), sprite_get_width(sprite), sprite_get_height(sprite));
			}
			if windowsOpened>25 {
				with game {
					waveVerticalIntensity+=.5;
					waveHorizontalIntensity+=.1;
					waveTime+=100;
				}
			}
			switch windowsOpened {
				case 10:
				case 25:
					laughPitch-=.3;
					openWindowFrequency-=5;
					shakeAmount+=.5;
				break;
				break;
				
				case 15:
					with createShrimpy("What hath God wrought") {
						destroyScript=function() {
							timer++;
							if timer>300 {
								state=1;
							}
						}
					}
				break;
			}
		}
		
		if windowsOpened>50 {
			audio_stop_all();
			playSound(sfxBaby, 100, 1);
			with game {
				waveHorizontalIntensity=0;
				waveVerticalIntensity=0;
			}
			with window {
				instance_destroy();
			}
			room_goto(rmCrash);
			state=2;
		}
	break;
}