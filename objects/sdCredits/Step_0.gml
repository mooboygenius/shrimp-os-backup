if live_call() return live_result;

switch state {
	case 0:
		timer++;
		if timer>60 {
			timer=0;
			state=1;
			playMusic(bgmSDVictory, false);
		}
	break;
	
	case 1:
		timer++;
		showClearedMessage=timer%2==0;
		if timer>30 {
			timer=0;
			state=2;
			showClearedMessage=true;
		}
	break;
	
	case 2:
		timer++;
		if timer>120 {
			playSound(sfxSDEnemyHit1, 100, 1);
			timer=0;
			showJack=true;
			shakeCamera(2);
			state=3;
		}
	break;
	
	case 3:
		timer++;
		if timer>20 {
			timer=0;
			showChris=true;
			shakeCamera(2);
			state=4;
			playSound(sfxSDEnemyHit2, 100, 1);
		}
	break;
	
	case 4:
		timer++;
		showPrompt=timer%2==0;
		if timer>60 {
			timer=0;
			state=5;
			showPrompt=true;
		}
	break;
	
	case 5:
		timer++;
		if timer>180 {
			timer=0;
			state=6;
		}
	break;
	
	case 6:
		timer++;
		showAll=timer%2;
		if timer>60 {
			showAll=false;
			timer=0;
			state=7;
		}
	break;
	
	case 7:
		timer++;
		if timer>60 {
			room_goto(rmBootup);
		}
	break;
}