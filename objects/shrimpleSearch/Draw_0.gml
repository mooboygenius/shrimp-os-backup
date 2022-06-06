if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(WHITE_COLOR, 1);
	var sc=1,
	sx=sprite_get_xoffset(sprShrimpleSmallLogo)*sc+8,
	sy=sprite_get_yoffset(sprShrimpleSmallLogo)*sc+12+scrollYLerp;
	draw_sprite_ext(sprShrimpleSmallLogo, 0, sx, sy, sc, sc, 0, c_white, 1);
	sx+=sprite_get_xoffset(sprShrimpleSmallLogo);
	with searchBar {
		image_xscale=2;
		sx+=sprite_xoffset+8;
		xstart=sx;
		ystart=sy;
	}
	
	var detailColor=$B8A44F,
	tx=8,
	ty=sy+10;
	draw_set_font(fntSmaller);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_color(tx, ty, concat("Found ", searchResultCount, " results."), detailColor, detailColor, detailColor, detailColor, 1);
	
	if searchResultCount==0 {
		draw_set_font(fntSystem);
		ty+=32;
		var str="";
		if string_length(searchTerm)<3 {
			str="Try a longer search term.";
		} else if string_pos(" ", searchTerm)>0 {
			show_debug_message("guh");
			str="Try searching for singular words, like \"art\" or \"game\".";
		} else if string_length(searchTerm)>=8 {
			str="Try searching for shorter words, like \"art\" or \"game\".";
		}
		show_debug_message(searchTerm)
		draw_text_ext_color(tx, ty, str, 12, portWidth-48, detailColor, detailColor, detailColor, detailColor, 1);
		scrollMinimum=0;
	} else {
		if ds_exists(searchResults, ds_type_list) {
			ty+=8;
			for (var i=0; i<ds_list_size(searchResults); i++) {
				with searchResults[| i] {
					xstart=tx+sprite_xoffset;
					ystart=ty+sprite_yoffset;
					ty+=sprite_height+2;
				}
			}
			scrollMinimum=-ty;
		}
	}
	
	draw_surface(childrenObjectSurf, 0, 0);
	
	surface_reset_target();
}