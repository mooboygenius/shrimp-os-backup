if live_call() return live_result;

addChildrenToParentWindow(children);

stickToWindow();

switch state {
	case 0:
		with parentWindow {
			childrenSurfaceX=lerp(childrenSurfaceX, 0, .2);
			if childrenSurfaceX<1 {
				childrenSurfaceX=0;
				other.state=1;
			}
		}
	break;
	
	case 1:
		timer++;
		if timer>60 {
			var n=choose(
			"HAVE A GREAT DAY! :)",
			"EAT YOUR GREENS",
			"GET PLENTY OF SLEEP",
			"REMEMBER TO TAKE A 15 MINUTE BREAK",
			"DRINK WATER",
			"PLAY DEAD ESTATE",
			"PLAY SHOOT TRIP DIE",
			"FOLLOW JACK PLEASE PLEASE PLEASE",
			"STAY HEALTHY",
			"DRIVE SAFE",
			"USE YOUR TURN SIGNAL",
			"DEATH IS INEVITABLE SPEND TIME WITH YOUR FAMILY",
			"LEARN FROM THE MISTAKES OF OTHERS",
			"HOIST THAT RAG",
			"EPIC WIN",
			"W",
			"AWESOME BASICALLY",
			"HOPE UR HAVING FUN",
			"EARTH WILL DIE SCREAMING"
			);
			if unlockedHardMode {
				n="\n";
			}
			text=[
			"EGGS: ", concat(eggs, "\n"),
			"TIME: ", string_replace_all(concat(string_format(minutes, 2, 0), ":", string_format(seconds, 2, 0), "\n"), " ", "0"), 
			"ENEMIES BLAMMED: ", concat(enemiesKilled, "\n"), 
			"COINS ACQUIESCED: ", concat(coins, "\n"), 
			concat("\n",
			n
			)
			];
			timer=0;
			state=2;
			statsSign=instance_create_depth(0, 0, -100, mumbaStatsSign);
			with statsSign {
				drawX=64;
				drawY=-sprite_get_height(sprMumbaStatsSign);
			}
			ds_list_add(children, statsSign);
		}
	break;
	
	case 2:
		timer++;
		if timer>60 {
			with parentWindow {
				cameraShake=5;
			}
			timer=0;
			with statsDisplay {
				fullText+=other.text[other.current];
				drawY-=2;
			}
			current++;
			if current>=array_length(text) {
				if unlockedHardMode showUnlockText=true;
				state=3;
			}
		}
	break;
	
	case 3:
		timer++;
		if timer>120 {
			state=4;
			timer=0;
			circleTransition=instance_create_depth(0, 0, -1000, mumbaCircleTransition);
			with circleTransition owner=other;
			with circleTransition {
				circleX=GAME_WIDTH div 2;
				circleY=GAME_HEIGHT div 2;
				circleSize=GAME_WIDTH*2;
				circleChange=-8;
			}
			with parentWindow {
				ds_list_add(children, other.circleTransition);
			}
		}
	break;
	
	case 4:
		with circleTransition {
			if circleSize<=0 {
				stopMumbaMusic();
				other.state=5;
			}
		}
	break;
	
	case 5:
		for (var i=0; i<ds_list_size(children); i++) {
			with children[| i] instance_destroy();
		}
		with circleTransition {
			circleChange=8;
		}
		var inst=instance_create_depth(0, 0, 0, bonusLevel);
		with parentWindow {
			ds_list_insert(children, 0, inst);
		}
		timer=0;
		state=6;
	break;
	
	case 6:
		timer++;
		if timer>60 {
			instance_destroy();
			with circleTransition {
				instance_destroy();
			}
		}
	break;
}

with statsDisplay {
	var l=.2;
	drawX=lerp(drawX, 16, l);
	drawY=lerp(drawY, 76, l);
}

if !instance_exists(bonusLevel) {
	with parentWindow {
		cameraX+=5;
	}

	with parentWindow {
		cameraLeftLimit=cameraX+GAME_WIDTH;
		cameraTopLimit=GAME_HEIGHT;
		cameraRightLimit=cameraX-GAME_WIDTH;
		cameraBottomLimit=-GAME_HEIGHT;
	}
}