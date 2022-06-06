if live_call() return live_result;

event_inherited();

var m=2;

switch state {
	case 0:
		timer++;
		if timer%4<2 {
			show=true;
		} else {
			show=false;
		}
		if timer>15 {
			timer=0;
			state=1;
			show=true;
			squish=.2;
			grace=5;
		}
		drawY-=m;
	break;
	
	case 1:
		timer++;
		if timer>90 {
			state=2;
			timer=0;
		}
		drawY-=m/10;
	break;
	
	case 2:
		timer++;
		if timer%4<2 {
			show=true;
		} else {
			show=false;
		}
		if timer>30 {
			instance_destroy();
		}
		drawY-=m;
	break;
}