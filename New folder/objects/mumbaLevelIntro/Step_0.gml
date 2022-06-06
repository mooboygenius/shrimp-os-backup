if live_call() return live_result;

event_inherited();

stickToWindow();

drawScript=function() {
	if show {
		var cy=GAME_HEIGHT div 3;
		draw_sprite_ext(readySprite, gameFrame*(sprite_get_speed(readySprite)/60), readyX, cy, 1+readySquish, 1-readySquish, 0, c_white, 1);
		cy+=32;
		draw_sprite_ext(goSprite, gameFrame*sprite_get_speed(goSprite), goX, cy, 1+goSquish, 1-goSquish, 0, c_white, 1);
	}
}

var l=.2;
readySquish=lerp(readySquish, 0, l);
goSquish=lerp(goSquish, 0, l);

var centerX=GAME_WIDTH div 2,
spd=18;
switch state {
	case 0:
		if !instance_exists(mumbaCircleTransition) {
			timer++;
			if timer>30 {
				timer=0;
				state=1;
				readySpeed=-spd;
				readySquish=1;
			}
		}
	break;
	
	case 1:
		if readyX+readySpeed<=centerX {
			readySpeed=0;
			readySquish=-.5;
			readyX=centerX;
			state=2;
			with mumbaLevel {
				if music==bgmMumbaBonusLevel playMumbaMusic(music, false);
			}
		}
	break;
	
	case 2:
		timer++;
		if timer>75 {
			goSpeed=spd;
			goSquish=1;
			timer=0;
			state=3;
		}
	break;
	
	case 3:
		if goX+goSpeed>=centerX {
			goSpeed=0;
			goSquish=-.5;
			goX=centerX;
			state=4;
			with mumbaLevel {
				if music!=bgmMumbaBonusLevel playMumbaMusic(music, true);
			}
			with mumbaPlayer {
				canMove=true;
				canControl=true;
				showUI=true;
			}
		}
	break;
	
	case 4:
		timer++;
		if timer>90 {
			timer=0;
			state=5;
		}
	break;
	
	case 5:
		squish=wave(-1, 1, 2)*.2;
		timer++;
		var t=2;
		if timer%t<(t/2) {
			show=false;
		} else {
			show=true;
		}
		if timer>15 {
			var makeNotice=false;
			with mumbaRealLevel {
				if enableGoal makeNotice=true;
			}
			if makeNotice {
				var inst=instance_create_depth(0, 0, -1000, mumbaEggsNotice);
				with inst {
					drawX=GAME_WIDTH div 2;
					drawY=GAME_HEIGHT div 2;
				}
				with parentWindow {
					ds_list_add(children, inst);
				}
			}
			instance_destroy();
		}
	break;
}

readyX+=readySpeed;
goX+=goSpeed;