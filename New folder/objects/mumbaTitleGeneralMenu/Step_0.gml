if live_call() return live_result;

event_inherited();

if ds_exists(children, ds_type_list) {
	switch state {
		case 0:
			for (var i=0; i<ds_list_size(children); i++) {
				with children[| i] {
					targetX+=wave(-1, 1, 1, i*.15)*3;
					if active squish=wave(-1, 1, .5)*.1;
					var sc=1,
					l=.5;
					if active {
						sc=1.5;
						angle+=.25;
						angle=angle%360;
						drawX+=random_range(-2, 2);
						drawY+=random_range(-2, 2);
					} else {
						angle=lerp(angle, 0, .3);
					}
					xScale=lerp(xScale, sc, l);
					yScale=lerp(yScale, sc, l);
				}
			}
		break;
	
		case 2:
			timer++;
			if timer>60 instance_destroy();
		break;
	}
}

drawScript=function(x, y) {
	draw_set_font(fntMumba);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_alpha(1);
	if gameFrame%60>=20 {
		drawTextOutlinedGeneral(GAME_WIDTH div 2, GAME_HEIGHT-20, concat("Use [", getStringFromInput(mumbaInputWeaponUp), "] & [", getStringFromInput(mumbaInputWeaponDown), "] to select\n[", getStringFromInput(mumbaInputJump), "] or [", getStringFromInput(mumbaInputFire), "] to confirm"), 12, 999);
	}
}
depth=-10000;