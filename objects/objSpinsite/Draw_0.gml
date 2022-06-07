if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_sprite_tiled(sprShrimpspinbg, 0, current_time*0.02, current_time*0.02);
	
	var tx=10, ty=0+scrollYLerp;
	
	draw_set_color(BLACK_COLOR);
	draw_set_font(fntShrimpspin);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	draw_sprite_ext(sprShrimpspin, 0, tx+150, ty+70,scale,scale,rot,-1,1);
	
	var dx=160, dy=115,
	dsep=14,
	dw=280,
	dt="You have been shrimpspinning for "+string(spins)+" spins!";
	draw_text_ext(dx, dy, dt, dsep, dw);
	
	
	draw_surface(childrenObjectSurf, 0, 0);
	
	draw_set_color(c_white);
	
	surface_reset_target();
}

scrollMinimum=0;