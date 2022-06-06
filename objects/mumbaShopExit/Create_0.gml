if live_call() return live_result;

event_inherited();

cart=noone;

with myPlayer {
	horizontalSpeed=-1.5;
	xScale=-1;
	x=other.goalX+32;
	y=other.goalY;
	while !place_meeting(x, y+1, mumbaWall) {
		y++;
	}
}

goAwayTransition=noone;

doStateMachine=function() {
	switch state {
		case 0:
			timer++;
			if timer>180 {
				goAwayTransition=instance_create_depth(0, 0, -1000, mumbaCircleTransition);
				with goAwayTransition owner=other;
				var w=1, h=1;
				with parentWindow {
					w=portWidth;
					h=portHeight;
					ds_list_add(children, other.goAwayTransition);
				}
				with goAwayTransition {
					circleX=w/2;
					circleY=h/2;
					circleSize=320;
					circleChange=-8;
				}
				timer=0;
				state=1;
			}
		break;
		
		case 1:
			with goAwayTransition {
				if circleSize<=0 {
					stopMumbaMusic();
					circleSize=0;
					other.state=2;
				}
			}
		break;
		
		case 2:
			var select=instance_create_depth(0, 0, 0, mumbaLevelSelectController),
			a=0,
			b=0;
			
			with mumbaPlayerData {
				a=levelA;
				b=levelB;
			}
			
			with select {
				var gx=0, gy=0;
				with levels[a][b][mumbaLevelData.mapObject] {
					active=true;
					gx=x;
					gy=y;
				}
				
				with mumba {
					timer=0;
					gotoX=gx;
					gotoY=gy;
					x=gx;
					y=gy;
				}
			}
			
			with parentWindow {
				ds_list_add(children, select);
			}
			
			with goAwayTransition {
				destroyAtSize=GAME_WIDTH*2;
				circleChange=8;
			}
			
			instance_destroy();
		break;
	}
}

timer=0;