if live_call() return live_result;

event_inherited();

angle=0;

if active && (input(mumbaInputJump, PRESS) || input(mumbaInputFire, PRESS)) {
	pressScript();
}

switch state {
	case -2:
		if strIn!="" {
			state=0;
			in=variable_global_get(strIn);
			sprite_index=generateSprite(concat(name, ": [", getStringFromInput(in), "]"), col, outlineCol, font, thick);
		}
	break;
	
	case -1:
		if !active {
			state=0;
			in=variable_global_get(strIn);
			sprite_index=generateSprite(concat(name, ": [", getStringFromInput(in), "]"), col, outlineCol, font, thick);
		}
	break;
	
	case 0:
		// chill
	break;
	
	case 1:
		holdTimer++;
		if holdTimer>5 {
			if keyboard_check_pressed(vk_anykey) {
				holdTimer=0;
				var k=keyboard_key;
				show_debug_message(concat("Attempting to bind ", getStringFromInput(k)));
			
				if (mumbaInputFire==k && mumbaInputFire!=in) || (mumbaInputJump==k && mumbaInputJump!=in) || (mumbaInputLeft==k && mumbaInputLeft!=in) || (mumbaInputRight==k && mumbaInputRight!=in) || (mumbaInputWeaponDown==k && mumbaInputWeaponDown!=in) || (mumbaInputWeaponUp==k && mumbaInputWeaponUp!=in) {
					sprite_index=generateSprite(concat(name, ": already bound :("), col, outlineCol, font, thick);
					state=-1;
				} else {
					variable_global_set(strIn, k);
					updateSetting(strIn, k);
					saveGame();
					in=k
					selected=0;
					sprite_index=generateSprite(concat(name, ": [", getStringFromInput(in), "]"), col, outlineCol, font, thick);
				}
			
				with mumbaTitleControlSettings {
					freezeSelection=false;
				}
			}
		}
	break;
}