if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	
	var tx=0, ty=0+scrollYLerp;
	
	draw_sprite(sprScrungebg, 0, 0, 0);
	draw_sprite(sprScrungePanels, 0, 0, ypos+ty);
	
	draw_sprite(sprScrungeArt, panel1, 20, 66+ypos+ty);
	draw_sprite(sprScrungeArt, panel2, 109, 64+ypos+ty);
	draw_sprite(sprScrungeArt, panel3, 208, 61+ypos+ty);
	
	draw_set_color(BLACK_COLOR);
	draw_set_font(fntSmaller);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_set_color(WHITE_COLOR);
	draw_text_ext(53, 75+ypos+ty, dial1, 6, 31);
	draw_text_ext(56, 75+ypos+ty, dial1, 6, 31);
	draw_text_ext(55, 74+ypos+ty, dial1, 6, 31);
	draw_text_ext(55, 76+ypos+ty, dial1, 6, 31);
	
	draw_set_color(BLACK_COLOR);
	draw_text_ext(54, 75+ypos+ty, dial1, 6, 31);
	
	draw_set_color(WHITE_COLOR);
	draw_text_ext(151, 70+ypos+ty, dial2, 6, 38);
	draw_text_ext(153, 70+ypos+ty, dial2, 6, 38);
	draw_text_ext(152, 69+ypos+ty, dial2, 6, 38);
	draw_text_ext(152, 71+ypos+ty, dial2, 6, 38);
	
	draw_set_color(BLACK_COLOR);
	draw_text_ext(152, 70+ypos+ty, dial2, 6, 38);
	
	draw_set_color(WHITE_COLOR);
	draw_text_ext(253, 69+ypos+ty, dial3, 6, 37);
	draw_text_ext(255, 69+ypos+ty, dial3, 6, 37);
	draw_text_ext(254, 68+ypos+ty, dial3, 6, 37);
	draw_text_ext(254, 70+ypos+ty, dial3, 6, 37);
	
	draw_set_color(BLACK_COLOR);
	draw_text_ext(254, 69+ypos+ty, dial3, 6, 37);
	
	
	draw_surface(childrenObjectSurf, 0, 0);
	
	draw_set_color(c_white);
	
	surface_reset_target();
}

scrollMinimum=-100;