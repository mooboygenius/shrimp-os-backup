if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		timer++;
		if timer>30 {
			timer=0;
			var cx=GAME_WIDTH div 2,
			cy=GAME_HEIGHT div 2;
			with mumbaTitleController {
				cx=lerp(centerX, cx, .3);
				cy=centerY;
			}
			circleTransition=instance_create_depth(0, 0, -1000, mumbaCircleTransition);
			with circleTransition {
				circleSize=GAME_WIDTH*2;
				circleX=cx;
				circleY=cy;
				circleChange=-8;
			}
			with parentWindow {
				ds_list_add(children, other.circleTransition);
			}
			state=1;
		}
	break;
	
	case 1:
		var go=false;
		with circleTransition {
			if circleSize<=0 {
				go=true;
			}
		}
		if go {
			stopMumbaMusic();
			state=2;
			timer=0;
		}
	break;
	
	case 2:
		timer++;
		if timer>60 {
			with circleTransition {
				circleX=GAME_WIDTH div 2;
				circleY=GAME_HEIGHT div 2;
				circleChange*=-1;
				destroyAtSize=GAME_WIDTH*2;
			}
			with mumbaTitleController instance_destroy();
			var obj=mumbaLevelSelectController;
			if loadData("beginnerBeachState", mumbaLevelState.incomplete)<mumbaLevelState.complete {
				obj=mumbaIntroController;
			}
			var inst=instance_create_depth(0, 0, 0, obj);
			with parentWindow {
				ds_list_add(children, inst);
			}
			instance_destroy();
		}
	break;
}