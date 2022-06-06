if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		if !instance_exists(mumbaLevelIntro) timer--;
		if timer<=0 {
			var l=20;
			with mumbaLevel {
				l=enemyCap;
			}
			if instance_number(mumbaEnemy)<=l {
				waves++;
			
				speedMultiplier=choose(-1, 1);
			
				if instance_exists(mumbaEnemySpawnPoint) {
					spawner=instance_find(mumbaEnemySpawnPoint, irandom(instance_number(mumbaEnemySpawnPoint)-1));
					spawnX=spawner.x;
					spawnY=spawner.y;
					show_debug_message(concat("selected enemy spawn point: ", spawner, ", (", spawnX, ", ", spawnY, ")"));
				} else {
					show_debug_message("no enemy spawn points?");
				}
			
				currentSpawnArray=normalWaves;
				if chance(hardWaveChance) || waves%hardWaveFrequency==0 {
					currentSpawnArray=hardWaves;
					show_debug_message("hard wave incoming");
				} else {
					show_debug_message("normal wave");
				}
				currentSpawnArray=currentSpawnArray[irandom(array_length(currentSpawnArray)-1)];
				waveSize=array_length(currentSpawnArray);
				show_debug_message(concat("wave size: ", waveSize));
				state=1;
			}
		}
	break;
	
	case 1:	
		show_debug_message(concat(currentSpawnArray[spawnIndex]));
		var inst=instance_create_depth(spawnX, spawnY, 0, currentSpawnArray[spawnIndex]),
		m=32,
		left=m,
		right=m;
		with mumbaLevel {
			right=tileSurfaceWidth-m;
		}
		
		with inst {
			horizontalSpeed=moveSpeed;
			if x>right {
				horizontalSpeed*=-1;
				xScale*=-1;
			} else if x==clamp(x, left, right) {
				show_debug_message(concat("multiplying by speed multiplier: ", other.speedMultiplier));
				horizontalSpeed=moveSpeed*other.speedMultiplier;
				xScale=other.speedMultiplier;
			}
			spawnX=other.spawnX;
			spawnY=other.spawnY;
			if chance(other.hardWaveChance/2) {
				hp*=4;
				image_xscale=1.5;
				image_yscale=image_xscale;
			}
			while place_meeting(x, y, mumbaWall) y--;
		}
		
		with parentWindow {
			ds_list_add(children, inst);
		}
		
		spawnIndex++;
		
		show_debug_message(concat(spawnIndex, "/", waveSize));
		
		if spawnIndex>=waveSize {
			state=0;
			waveSize=0;
			spawnIndex=0;
			timer=irandom_range(spawnTimerMinimum, spawnTimerMaximum);
		} else {
			state=2;
			timer=25;
		}
	break;
	
	case 2:
		timer--;
		if timer<=0 {
			timer=0;
			state=1;
		}
	break;
}