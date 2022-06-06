if live_call() return live_result;

event_inherited();

var l=.05;
xScale=lerp(xScale, 1, l);
yScale=lerp(yScale, 1, l);

var gx=64, gy=GAME_HEIGHT div 2;

switch state {
	case 0:
		turnSpeed=lerp(turnSpeed, 5, .05);
		angle+=turnSpeed;
		if point_distance(drawX, drawY, gx, gy)<=4 {
			state=1;
			angle=angle%360;
			x+=random_range(-3, 3);
			y+=random_range(-3, 3);
		}
	break;
	
	case 1:
		var m=2;
		if angle<340 {
			turnSpeed=lerp(turnSpeed, 5, .2);
		} else {
			turnSpeed=lerp(turnSpeed, 1, .2);
		}
		angle+=turnSpeed;
		if point_distance(0, angle, 0, 0)<=m || point_distance(0, angle, 0, 360)<=m {
			state=2;
			turnSpeed=.1;
		}
	break;
	
	case 2:
		if point_distance(0, angle, 0, 0)<=1 || point_distance(0, angle, 0, 360)<=1 {
			angle=0;
			state=3;
		}
		angle+=turnSpeed;
	break;
	
	case 3:
		turnSpeed=wave(.1, .4, 10);
		angle+=turnSpeed;
		var l=8, t=gameFrame;
		gx+=lengthdir_x(l, t);
		gy+=lengthdir_y(l, t);
		squish=wave(-1, 1, 3)*.05;
	break;
}

var l=.03;
drawX=lerp(drawX, gx, l);
drawY=lerp(drawY, gy, l);