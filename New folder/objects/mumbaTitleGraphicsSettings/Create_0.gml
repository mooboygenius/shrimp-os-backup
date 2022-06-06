if live_call() return live_result;

event_inherited();

var fnt=fntSystem;

with createMenuOption("GRAPHICS", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleSwitchOption) {
	options=["ON", "OFF"];
	
	current=!mumbaGraphicsOn;
	
	sprite_index=generateSprite(concat(name, ": ", options[current]), col, outlineCol, font, thick);
	
	pressScript=function() {
		defaultSwitchOptionScript();
		mumbaGraphicsOn=!current;
		unlockMedal("Pitch Black");
		updateSetting("mumbaGraphicsOn", mumbaGraphicsOn);
		saveGame();
	}
}

with createMenuOption("PARTICLES", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleSwitchOption) {
	options=["ON", "OFF"];
	
	current=!mumbaParticlesOn;
	
	sprite_index=generateSprite(concat(name, ": ", options[current]), col, outlineCol, font, thick);
	
	pressScript=function() {
		defaultSwitchOptionScript();
		mumbaParticlesOn=!current;
		updateSetting("mumbaParticlesOn", mumbaParticlesOn);
		saveGame();
	}
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