if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		var e=0;
		with mumbaPlayer {
			e=eggs;
		}
		
		if e>=50 && !unlockedEggs {
			repeat(20) show_debug_message("EGGATHON GET");
			unlockMedal(eggMedalName);
			updateData(concat(winLevelName, "Eggathon"), true);
			saveGame();
			unlockedEggs=true;
		}
		
		time++;
		if time>=60 {
			seconds++;
			if seconds>=60 {
				minutes++;
				seconds=0;
			}
			time=0;
		}
		
		with mumbaPlayer if hp<maximumHp other.playerIsAtFullHealth=false;
		
		maximumTime--;
		
		if enableGoal && e>=eggGoal {
			if maximumTime>=0 {
				unlockMedal(timeMedalName);
				updateData(concat(winLevelName, "TimeTrial"), true);
			}
			playMumbaSound(sfxMumbaLevelWin, 100, 1);
			won=true;
			state=1;
			setCameraShake(4);
			with mumbaLivingObject {
				verticalKnockback-=3;
			}
			repeat(100) {
				createMumbaParticle(random(GAME_WIDTH), random(-128), mumbaConfettiParticle, 1);
			}
			playMumbaMusic(bgmMumbaWin, false);
			var inst=instance_create_depth(0, 0, -10000, mumbaWinPopup);
			with parentWindow {
				ds_list_add(children, inst);
			}
		}
	break;
	
	case 1:
		timer++;
		if timer>150 {
			timer=0;
			state=2;
		}
	break;
	
	case 2:
		with parentWindow {
			childrenSurfaceX=lerp(childrenSurfaceX, 48, .1);
		}
		timer++;
		if timer>30 {
			timer=0;
			state=3;
		}
	break;
	
	case 3:
		with parentWindow {
			childrenSurfaceX-=30;
		}
		timer++;
		if timer>60 {
			var backs=ds_list_create(),
			n=0;
			for (var i=0; i<instance_number(mumbaBackground); i++) {
				with instance_find(mumbaBackground, i) {
					if loops {
						ds_list_add(backs, ds_map_create());
						backs[| n][? "object"]=object_index;
						backs[| n][? "sprite"]=sprite_index;
						backs[| n][? "drawX"]=drawX;
						backs[| n][? "drawY"]=drawY;
						backs[| n][? "cameraXMultiplier"]=cameraXMultiplier;
						backs[| n][? "cameraYMultiplier"]=cameraYMultiplier;
						backs[| n][? "horizontalSpeed"]=horizontalSpeed;
						backs[| n][? "verticalSpeed"]=verticalSpeed;
						n++;
					}
				}
			}
			
			var alreadyComplete=loadData(concat(winLevelName, "State"), mumbaLevelState.complete)==mumbaLevelState.complete;
			updateData(concat(winLevelName, "State"), mumbaLevelState.complete);
			for (var i=0; i<array_length(unlockLevels); i++) {
				var n=concat(unlockLevels[i], "State");
				updateData(n, max(mumbaLevelState.unlocked, loadData(n, mumbaLevelState.unlocked)));
			}
			saveGame();
			
			instance_destroy();
			
			with mumbaWorldObject instance_destroy();
			
			var stats=instance_create_depth(0, 0, 0, mumbaStatsScreen);
			
			with stats {
				coins=other.coinsGrabbed;
				minutes=other.minutes;
				seconds=other.seconds;
				enemiesKilled=other.enemiesKilled;
				eggs=other.eggsGrabbed;
				bonusLevel=other.bonusLevel;
				unlockedHardMode=!alreadyComplete;
			}
			
			for (var i=0; i<ds_list_size(backs); i++) {
				var back=instance_create_depth(0, 0, 0, backs[| i][? "object"]);
				with back {
					sprite_index=backs[| i][? "sprite"];
					drawX=backs[| i][? "drawX"];
					drawY=backs[| i][? "drawY"];
					cameraXMultiplier=backs[| i][? "cameraXMultiplier"];
					cameraYMultiplier=backs[| i][? "cameraYMultiplier"];
					horizontalSpeed=backs[| i][? "horizontalSpeed"];
					verticalSpeed=backs[| i][? "verticalSpeed"];
					loops=true;
				}
				with stats {
					ds_list_add(children, back);
				}
			}
			
			for (var i=0; i<ds_list_size(backs); i++) {
				ds_map_destroy(backs[| i]);
			}
			ds_list_destroy(backs);
			
			with parentWindow {
				ds_list_add(children, stats);
				childrenSurfaceX=GAME_WIDTH;
			}
		}
	break;
}