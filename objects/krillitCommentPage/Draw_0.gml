if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	var dy=42+scrollYLerp,
	dw=248;
	with fullPost {
		width=dw;
		xstart=sprite_xoffset+1;
		ystart=dy+height/2;
		dy+=sprite_height+2;
	}
	
	dy+=2;
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntSystem);
	var s=ds_list_size(replies);
	draw_text_color(4, dy, concat("REPLIES (", s, ")"), orangeColor, orangeColor, orangeColor, orangeColor, 1);
	dy+=14;
	
	for (var i=0; i<s; i++) {
		with replies[| i] {
			width=dw;
			xstart=sprite_xoffset+1;
			ystart=dy+height/2;
			dy+=sprite_height+2;
		}
	}
	
	surface_reset_target();
}

scrollMinimum=-320;