if live_call() return live_result;

event_inherited();

var fnt=fntSystem;

with createMenuOption("MOVE LEFT", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleControlRebindOption) {
	strIn="mumbaInputLeft";
}

with createMenuOption("MOVE RIGHT", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleControlRebindOption) {
	strIn="mumbaInputRight";
}

with createMenuOption("JUMP", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleControlRebindOption) {
	strIn="mumbaInputJump";
}

with createMenuOption("SHOOT", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleControlRebindOption) {
	strIn="mumbaInputFire";
}

with createMenuOption("NEXT WEAPON", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleControlRebindOption) {
	strIn="mumbaInputWeaponDown";
}

with createMenuOption("PREV WEAPON", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleControlRebindOption) {
	strIn="mumbaInputWeaponUp";
}

with createMenuOption("BACK", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitlePressableOption) {
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
			drawX=targetX+100;
			drawY=targetY;
		}
		with parentWindow {
			ds_list_insert(children, 0, inst);
		}
	}
}