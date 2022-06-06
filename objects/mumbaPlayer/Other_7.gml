if live_call() return live_result;

switch sprite_index {
	case sprMumbaStartJump:
		setSprite(self, sprMumbaJump);
	break;
	
	case sprMumbaStartWalk:
		setSprite(self, sprMumbaWalk);
	break;
	
	case sprMumbaStopWalk:
	case sprMumbaLand:
		setSprite(self, sprMumba);
	break;
	break;
	
	case sprMumbaSwitchToFall:
		if verticalSpeed>0 {
			setSprite(self, sprMumbaFall);
		} else if verticalSpeed<0 {
			setSprite(self, sprMumbaJump);
		} else {
			setSprite(self, sprMumba);
		}
	break;
	
	case sprMumbaDeath:
		setSprite(self, sprMumbaDead);
	break;
}