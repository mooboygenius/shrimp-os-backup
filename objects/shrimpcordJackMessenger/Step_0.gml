if live_call() return live_result;

var makeMessage=function(t, obj=shrimpcordMessage) {
	with shrimpcordMessageManager {
		createMessage(other.name, t, other.profileImage, current_hour, current_minute, true, obj);
	}
	state++;
	timer=0;
}

switch state {
	case 0:
		timer++;
		if timer>30 {
			makeMessage("The Hello");
		}
	break;
	
	case 1:
		timer++;
		if timer>60 {
			makeMessage("You need to download my game");
		}
	break;
	
	case 2:
		timer++;
		if timer>60 {
			makeMessage("This is not a worm You \nYou will not the receive worm from this");
		}
	break;
	
	case 3:
		timer++;
		if timer>120 {
			makeMessage("Hpold on while I am the upload the game you to download");
		}
	break;
	
	case 4:
		timer++;
		if timer>90 {
			makeMessage("This is not a worm");
		}
	break;
	
	case 5:
		timer++;
		if timer>90 {
			makeMessage("You will benefit from a worm;");
		}
	break;
	
	case 6:
		timer++;
		if timer>45 {
			makeMessage("a worm.");
		}
	break;
	
	case 7:
		timer++;
		if timer>180 {
			makeMessage("OK the upload is complete. Please click to download the worm.");
		}
	break;
	
	case 8:
		timer++;
		if timer>60 {
			makeMessage("", shrimpcordDownloadMessage);
		}
	break;
}

show_debug_message(state);