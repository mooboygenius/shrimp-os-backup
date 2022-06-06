if live_call() return live_result;

var n=3;

switch timesFired%4 {
	case 1:
	case 3:
		n+=1;
	break;
	break;
	
	case 2:
		n+=2;
	break;
}

bulletNumber=n;


event_inherited();
