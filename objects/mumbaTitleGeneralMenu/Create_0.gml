if live_call() return live_result;

event_inherited();

with createMenuOption("START", WHITE_COLOR, BLACK_COLOR, mumbaLevelFont, 2, mumbaTitlePressableOption) {
	pressScript=function() {
		stopMumbaMusic();
		playMumbaSound(sfxMumbaLevelSelectChoose);
		var inst=instance_create_depth(0, 0, owner.depth-10, mumbaStartGame);
		with parentWindow ds_list_insert(children, 0, inst);
		with owner {
			throwOptions();
		}
	}
}

with createMenuOption("SETTINGS", WHITE_COLOR, BLACK_COLOR, mumbaLevelFont, 2, mumbaTitlePressableOption) {
	pressScript=function() {
		with owner {
			throwOptions();
		}
		var inst=instance_create_depth(0, 0, owner.depth, mumbaTitleSettings),
		tx=owner.targetX,
		ty=owner.targetY;
		with inst {
			targetX=tx;
			targetY=ty;
			drawX=targetX+GAME_WIDTH;
			drawY=targetY;
		}
		with parentWindow {
			ds_list_insert(children, 0, inst);
		}
	}
}

with createMenuOption("QUIT", WHITE_COLOR, BLACK_COLOR, mumbaLevelFont, 2, mumbaTitlePressableOption) {
	pressScript=function() {
		with owner {
			throwOptions();
		}
		with parentWindow {
			state=windowStates.close;
		}
	}
}

timer=0;

forceDraw=true;