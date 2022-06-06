if live_call() return live_result;

event_inherited();

if hp>(maximumHp/2) {
	switch state {
		case 0:
			timer++;
			if gotHurt {
				var mx=GAME_WIDTH/2;
				with mumbaPlayer mx=x;
				if mx<x xScale=-1 else xScale=1;
			}
			if timer>30 || gotHurt {
				timer=0;
				state=1;
				setSprite(self, sprMumbaSnowmanStartJump);
			}
		break;
	
		case 1:
			if place_meeting(x, y+1, mumbaWall) && sprite_index!=sprMumbaSnowmanStartJump {
				timer=0;
				state=2;
				horizontalSpeed=0;
				setSprite(self, sprMumbaSnowmanLand);
				makeDust();
			}
		break;
	}

	if verticalSpeed>0 {
		if sprite_index==sprMumbaSnowmanJump setSprite(self, sprMumbaSnowmanSwitchToFall);
	}

	gotHurt=false;
} else {
	if !halfway {
		halfway=true;
		grace=20;
		state=0;
		timer=0;
		y-=4;
		verticalKnockback=-2;
		setSprite(self, sprMumbaSnowmanJumpHeadOnly);
		mask_index=sprMumbaSnowmanJumpHeadOnly;
		setCameraShake(3);
	}
		
	if verticalSpeed<0 {
		setSprite(sprMumbaSnowmanJumpHeadOnly);
	} else {
		setSprite(sprMumbaSnowmanFallHeadOnly);
	}
	
	if place_meeting(x, y+1, mumbaWall) {
		squish=.4;
		verticalSpeed=-2;
		if horizontalSpeed==0 horizontalSpeed=moveSpeed;
		createMumbaParticle(x-horizontalSpeed, y+sprite_yoffset, mumbaDustParticle)
	}
}

if place_meeting(x+horizontalSpeed, y, mumbaWall) horizontalSpeed*=-1;