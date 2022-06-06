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