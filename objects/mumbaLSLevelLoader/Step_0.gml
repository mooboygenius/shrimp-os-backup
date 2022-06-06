if live_call() return live_result;

event_inherited();

addChildrenToParentWindow(children);

switch state {
	case 0:
		timer++;
		if timer>30 {
			lvl=instance_create_depth(0, 0, 0, levelObject);
			ds_list_add(children, lvl);
			goingToRealLevel=object_is_ancestor(levelObject, mumbaLevel) && !object_is_ancestor(levelObject, mumbaShopEnter);
			if goingToRealLevel {
				var w=GAME_WIDTH;
				with lvl {
					w=tileSurfaceWidth;
				}
				with mumbaPlayer {
					canMove=false;
					canControl=false;
					showUI=false;
					x=w/2;
				}
			}
			state=1;
			timer=0;
		}
	break;
	
	case 1:
		timer++;
		with owner {
			instance_destroy();
		}
		if timer>30 {
			with circle {
				circleChange=8;
			}
			timer=0;
			state=2;
		}
	break;
	
	case 2:
		with circle {
			if circleSize>GAME_WIDTH {
				other.state=3;
				instance_destroy();
			}
		}
	break;
	
	case 3:
		if goingToRealLevel {
			intro=instance_create_depth(0, 0, -1000, mumbaLevelIntro);
			ds_list_add(children, intro);
			with parentWindow {
				ds_list_add(children, other.intro);
			}
		}
		instance_destroy();
	break;
}
