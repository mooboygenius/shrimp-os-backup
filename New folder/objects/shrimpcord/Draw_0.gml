if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	draw_set_font(fntSmaller);
	if surface_exists(childrenObjectSurf) draw_surface(childrenObjectSurf, 0, 0);
	var sy=12,
	sx=10,
	xx=sx,
	tx=xx+13,
	yy=sy;
	switch substate {
		case shrimpcordStates.friendList:
			var t="",
			o=102,
			tx=o+((portWidth-o)/2),
			ty=portHeight/2;
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			if !instance_exists(shrimpcordMessageManager) {
				t="select a shrimp friend :)";
			} else if !instance_exists(shrimpcordMessage) {
				t="start talking :)\nnow.";
				ty-=20;
			}
			draw_text_color(tx, ty, t, coolColor, coolColor, coolColor, coolColor, 1);
		break;
	}
	surface_reset_target();
}