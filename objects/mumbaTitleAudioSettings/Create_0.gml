if live_call() return live_result;

event_inherited();

var fnt=fntSystem;

with createMenuOption("MASTER GAIN", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleSwitchOption) {
	options=["100%", "75%", "50%", "25%", "0%"];
	
	switch mumbaMasterVolume {
		case 1: current=0 break;
		case 3/4: current=1 break;
		case 1/2: current=2 break;
		case 1/4: current=3 break;
		case 0: current=4 break;
	}
	
	sprite_index=generateSprite(concat(name, ": ", options[current]), col, outlineCol, font, thick);
	
	pressScript=function() {
		defaultSwitchOptionScript();
		switch current {
			case 0: mumbaMasterVolume=1 break;
			case 1: mumbaMasterVolume=3/4 break;
			case 2: mumbaMasterVolume=1/2 break;
			case 3: mumbaMasterVolume=1/4 break;
			case 4: mumbaMasterVolume=0 break;
		}
		
		updateSetting("mumbaMasterVolume", mumbaMasterVolume);
		saveGame();
		with game adjustGains();
	}
}

with createMenuOption("MUSIC GAIN", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleSwitchOption) {
	options=["100%", "75%", "50%", "25%", "0%"];
	
	switch mumbaMusicVolume {
		case 1: current=0 break;
		case 3/4: current=1 break;
		case 1/2: current=2 break;
		case 1/4: current=3 break;
		case 0: current=4 break;
	}
	
	sprite_index=generateSprite(concat(name, ": ", options[current]), col, outlineCol, font, thick);
	
	pressScript=function() {
		defaultSwitchOptionScript();
		switch current {
			case 0: mumbaMusicVolume=1 break;
			case 1: mumbaMusicVolume=3/4 break;
			case 2: mumbaMusicVolume=1/2 break;
			case 3: mumbaMusicVolume=1/4 break;
			case 4: mumbaMusicVolume=0 break;
		}
		
		updateSetting("mumbaMusicVolume", mumbaMusicVolume);
		saveGame();
		with game adjustGains();
	}
}


with createMenuOption("SOUND GAIN", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleSwitchOption) {
	options=["100%", "75%", "50%", "25%", "0%"];
	
	switch mumbaSoundVolume {
		case 1: current=0 break;
		case 3/4: current=1 break;
		case 1/2: current=2 break;
		case 1/4: current=3 break;
		case 0: current=4 break;
	}
	
	sprite_index=generateSprite(concat(name, ": ", options[current]), col, outlineCol, font, thick);
	
	pressScript=function() {
		defaultSwitchOptionScript();
		switch current {
			case 0: mumbaSoundVolume=1 break;
			case 1: mumbaSoundVolume=3/4 break;
			case 2: mumbaSoundVolume=1/2 break;
			case 3: mumbaSoundVolume=1/4 break;
			case 4: mumbaSoundVolume=0 break;
		}
		
		updateSetting("mumbaSoundVolume", mumbaSoundVolume);
		saveGame();
		with game adjustGains();
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