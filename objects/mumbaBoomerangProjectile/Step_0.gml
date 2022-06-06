if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		var l=.1;
		horizontalSpeed=lerp(horizontalSpeed, 0, l);
		verticalSpeed=lerp(verticalSpeed, 0, l);
		if point_distance(0, 0, horizontalSpeed, verticalSpeed)<1 {
			life=180;
			horizontalSpeed=0;
			verticalSpeed=0;
			state=1;
		}
	break;
	
	case 1:
		var a=0;
		with mumbaPlayer {
			show_debug_message("aaa");
			a=point_direction(other.x, other.y, x, y);
		}
		var spd=8,
		l=.2;
		horizontalSpeed=lerp(horizontalSpeed, lengthdir_x(spd, a), l);
		verticalSpeed=lerp(verticalSpeed, lengthdir_y(spd, a), l);
		if place_meeting(x, y, mumbaPlayer) {
			life=0;
			playMumbaSound(sfxMumbaBoomerangCatch, 100, random_range(.9, 1.1));
		}
	break;
}

if gameFrame%2==0 angle+=40;