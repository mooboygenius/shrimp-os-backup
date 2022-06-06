if live_call() return live_result;

event_inherited();

var samples=[sprShrimpPaintSample1, sprShrimpPaintSample2, sprShrimpPaintSample3]
if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	
	var sx=6,
	sy=56+scrollYLerp;
	with downloadProgramButton {
		xstart=sprite_xoffset+sx;
		ystart=sprite_yoffset+sy;
		show_debug_message("ball")
		sy+=sprite_height+8;
	}
	
	var pinkColor=$7752FF;
	draw_set_font(fntSystem);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var sep=12,
	w=portWidth*.4,
	t="Shrimp Paint is the premier art tool for aspiring and professional artists alike!\n\nIt's quick and shrimple to get started as it seems!\n\nCheck out the images on the right for examples of work made in Shrimp Paint!"
	draw_text_ext_color(sx, sy, t, sep, w, pinkColor, pinkColor, pinkColor, pinkColor, 1);
	
	var sampleX=GAME_WIDTH-72,
	sampleY=96+scrollYLerp;
	for (var i=0; i<array_length(samples); i++) {
		var spr=samples[i];
		draw_sprite(spr, 0, sampleX, sampleY);
		sampleY+=sprite_get_height(spr)+6;
	}
	
	scrollMinimum=-172;
	
	surface_reset_target();
}