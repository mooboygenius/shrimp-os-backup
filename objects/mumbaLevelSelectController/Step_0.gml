if live_call() return live_result;

event_inherited();

if ds_exists(children, ds_type_list) {
	addChildrenToParentWindow(children);

	positionLevels();

	with mumba {
		setCameraFocus(self);
	}
	
	with parentWindow {
		cameraLeftLimit=9999;
		cameraRightLimit=-9999;
		cameraTopLimit=0;
		cameraBottomLimit=0;
		cameraY=0;
	}

	var hin=input(mumbaInputRight, PRESS)-input(mumbaInputLeft, PRESS),
	vin=input(mumbaInputWeaponDown, PRESS)-input(mumbaInputWeaponUp, PRESS),
	canMove=false;
	with mumba {
		if state==0 && horizontalSpeed==0 && verticalSpeed==0 {
			canMove=true;
		}
	}
	
	if !allowMovement canMove=false;

	if (hin!=0 || vin!=0) && canMove {
	
		var move=true;
		if abs(hin)>0 && sign(hin)!=sign(mumba.xScale) {
			mumba.squish=-.2;
			mumba.targetXScale*=-1;
			move=false;
		}
	
	
		var xa=0;
		with mumba xa=sign(targetXScale);
		var prevA=currentLevelA,
		prevB=currentLevelB;
		if move currentLevelA+=xa;
		currentLevelA=clamp(currentLevelA, 0, array_length(levels)-1);
		if prevA!=currentLevelA currentLevelB+=vin;
		currentLevelB=clamp(currentLevelB, 0, array_length(levels[currentLevelA])-1);
		if loadData(levels[currentLevelA][currentLevelB][mumbaLevelData.dataString], mumbaLevelState.hidden)>mumbaLevelState.hidden {
			var gx=0,
			gy=0;
	
			with mumbaLSLevelCoin {
				active=false;
			}
	
			with levels[currentLevelA][currentLevelB][mumbaLevelData.mapObject] {
				gx=x;
				gy=y;
				active=true;
			}
		
			with mumbaPlayerData {
				levelA=other.currentLevelA;
				levelB=other.currentLevelB;
			}
			
			updateData("mumbaLevelA", currentLevelA);
			updateData("mumbaLevelB", currentLevelB);
			saveGame();

			with mumba {
				timer=0;
				gotoX=gx;
				gotoY=gy;
			}
		} else {
			currentLevelA=prevA;
			currentLevelB=prevB;
		}
	}
}