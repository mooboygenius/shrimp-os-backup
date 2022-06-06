if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(c_white, 1);
	var t=current_time/30;
	draw_sprite_tiled(sprCoolBackground, 0, t, t);
	if surface_exists(childrenObjectSurf) draw_surface(childrenObjectSurf, 0, 0);
	
	draw_set_font(fntSystem);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var hx=4, hy=4, h="Change your Shrimptop\nbackground";
	hx+=random_range(-1, 1);
	hy+=random_range(-1, 1);
	draw_set_color(BLACK_COLOR);
	draw_text(hx, hy, h);
	draw_set_font(fntSmaller);
	var desc=concat("pick from ", array_length(backgrounds), " beautiful backgroundz"),
	descx=4,
	descy=32+wave(-2, 2, 2);
	draw_text(descx, descy, desc);
	draw_set_font(fntSystem);
	draw_set_color(c_white);
	draw_sprite(image, current_time/100, portWidth div 2+56, 40+wave(-2, 2, 2, .5));
	
	surface_reset_target();
} else {
	finalSurf=surface_create(portWidth, portHeight);
}