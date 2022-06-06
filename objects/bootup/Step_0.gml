if live_call() return live_result;
if timer%2==0 lines[2]=concat("\nSystem Health...I'VE SEEN BETTER, IntTemp=", random_range(800, 950), "F");
lines[4]=concat("Memory Test :  ", string_replace_all(string_format(kilobytes, 4, 0), " ", "0"), "KB");

switch current {
	case 5:
		timer++;
		kilobytes+=80;
		if beenThroughIntro kilobytes+=100;
		if kilobytes>=4000 {
			kilobytes=4000;
			timer=0;
			current++;
		}
	break;
	
	default:
		timer++;
		if beenThroughIntro timer+=2;
		
		if current>array_length(lines)+1 {
			if timer>60 {
				drawLines=false;
				if timer>180 {
					instance_destroy();
					instance_create_depth(0, 0, depth, shrimpOSLoading);
				}
			}
		} else {
			if timer>15 {
				timer=0;
				current++;
			}
		}
	break;
}