if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		with mumbaPlayer {
			canMove=false;
			canControl=false;
		}
		timer++;
		if timer>60 {
			timer=0;
			state=1;
			intro=instance_create_depth(0, 0, -1000, mumbaLevelIntro);
			with parentWindow {
				ds_list_add(children, other.intro);
			}
			with intro {
				readySprite=sprMumbaBonusText;
			}
		}
	break;
	
	case 1:
		if !instance_exists(mumbaLevelIntro) timer++;
		if timer>16 {
			timer=0;
			state=2;
		}
	break;
	
	case 2:
		coins--;
		var mx=tileSurfaceWidth div 2,
		my=tileSurfaceHeight div 2;
		with instance_find(mumbaCoinSpawner, irandom(instance_number(mumbaCoinSpawner)-1)) {
			mx=x;
			my=y;
		}
		var inst=instance_create_depth(mx, my, -10, mumbaCoin);
		with inst {
			verticalSpeed=2;
			horizontalSpeed=irandom_range(-1, 1);
			if my>48 {
				horizontalSpeed=random_range(2, 4);
				if mx>48 {
					horizontalSpeed*=-1;
				}
			}
			grace=10;
		}
		ds_list_add(children, inst);
		if coins>0 {
			state=1;
		} else {
			circleTransition=instance_create_depth(0, 0, -1000, mumbaCircleTransition);
			with circleTransition {
				circleX=GAME_WIDTH div 2;
				circleY=GAME_HEIGHT div 2;
				circleSize=GAME_WIDTH*2;
				circleChange=0;
			}
			with parentWindow {
				ds_list_add(children, other.circleTransition);
			}
			state=3;
		}
	break;
	
	case 3:
		timer++;
		if timer>180 {
			timer=0;
			state=4;
			with circleTransition {
				circleChange=-8;
			}
		}
	break;
	
	case 4:
		var go=false;
		with circleTransition {
			if circleSize<=0 {
				go=true;
			}
		}
		if go {
			state=5;
			
			with mumbaPlayer {
				show_debug_message("BALLERS LIFE");
				instance_destroy();
			}
			
			for (var i=0; i<ds_list_size(children); i++) {
				with children[| i] {
					instance_destroy();
				}
			}
		}
	break;
	
	case 5:
		timer++;
		if timer>30 {
			timer=0;
			state=6;
			with circleTransition {
				circleChange=8;
				destroyAtSize=GAME_WIDTH*2;
			}
		}
	break;
	
	case 6:
		var inst=instance_create_depth(0, 0, 0, gotoShopIntro)
		
		with parentWindow {
			ds_list_add(children, inst);
		}
		
		instance_destroy();
	break;
}