if live_call() return live_result;

event_inherited();

with createMenuOption("GRAPHIX", WHITE_COLOR, BLACK_COLOR, mumbaLevelFont, 2, mumbaTitlePressableOption) {
	pressScript=function() {
		with owner {
			throwOptions();
		}
		var inst=instance_create_depth(0, 0, owner.depth, mumbaTitleGraphicsSettings),
		tx=owner.targetX,
		ty=owner.targetY;
		with inst {
			targetX=tx;
			targetY=ty;
			drawX=targetX+100;
			drawY=targetY;
		}
		with parentWindow {
			ds_list_insert(children, 0, inst);
		}
	}
}

with createMenuOption("AUDIO", WHITE_COLOR, BLACK_COLOR, mumbaLevelFont, 2, mumbaTitlePressableOption) {
	pressScript=function() {
		with owner {
			throwOptions();
		}
		var inst=instance_create_depth(0, 0, owner.depth, mumbaTitleAudioSettings),
		tx=owner.targetX,
		ty=owner.targetY;
		with inst {
			targetX=tx;
			targetY=ty;
			drawX=targetX+100;
			drawY=targetY;
		}
		with parentWindow {
			ds_list_insert(children, 0, inst);
		}
	}
}

with createMenuOption("CONTROLS", WHITE_COLOR, BLACK_COLOR, mumbaLevelFont, 2, mumbaTitlePressableOption) {
	pressScript=function() {
		with owner {
			throwOptions();
		}
		var inst=instance_create_depth(0, 0, owner.depth, mumbaTitleControlSettings),
		tx=owner.targetX,
		ty=owner.targetY;
		with inst {
			targetX=tx;
			targetY=ty;
			drawX=targetX+100;
			drawY=targetY;
		}
		with parentWindow {
			ds_list_insert(children, 0, inst);
		}
	}
}

with createMenuOption("BACK", WHITE_COLOR, BLACK_COLOR, mumbaLevelFont, 2, mumbaTitlePressableOption) {
	pressScript=function() {
		with owner {
			throwOptions();
		}
		var inst=instance_create_depth(0, 0, owner.depth, mumbaTitleGeneralMenu),
		tx=owner.targetX,
		ty=owner.targetY;
		with inst {
			targetX=tx;
			targetY=ty;
			drawX=targetX+100;
			drawY=targetY;
		}
		with parentWindow {
			ds_list_insert(children, 0, inst);
		}
	}
}