if live_call() return live_result;


switch state {
	case 0:
		timer++;
		if timer%30==0 {
			showText=!showText;
		}
		if timer>300 {
			timer=0;
			state=1;
			showText=true;
		}
	break;
	
	case 1:
		timer++;
		if timer>60 {
			timer=0;
			state=2;
		}
	break;
	
	case 2:
		wipeTimer--;
		if wipeTimer<=0 {
			wipeTimer=4;
			wipeHeight+=10;
		}
		if wipeHeight>=GAME_WIDTH/2 {
			timer=0;
			text="";
			wipeHeight=0;
			state=3;
		}
	break;
	
	case 3:
		timer++;
		if timer>30 {
			timer=0;
			state=4;
			text="Consider yourself damn lucky\nthat we have ways around this.";
		}
	break;
	
	case 4:
		timer++;
		if timer>120 {
			timer=0;
			state=5;
			text+="\n\nThe system will now reboot\nin virus defense mode."
		}
	break;
	
	case 5:
		timer++;
		if timer>120 {
			timer=0;
			state=6;
			text+="\n\nJust give it a second.";
		}
	break;
	
	case 6:
		timer++;
		if timer%20==0 {
			text+=".";
		}
		if timer>180 {
			wipeTimer--;
			if wipeTimer<=0 {
				wipeTimer=4;
				wipeHeight+=10;
			}
			if wipeHeight>=GAME_WIDTH {
				timer=0;
				text="";
				wipeHeight=0;
				state=7;
			}
			room_goto(rmShrimpDefender);
		}
	break;
}