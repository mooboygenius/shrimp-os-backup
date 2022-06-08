if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	
	draw_clear_alpha(WHITE_COLOR, 1);
	var px=gameFrame/10;
	draw_sprite_tiled(sprAwesomeShrimpBackground, gameFrame/5, px, px);
	var m=4;
	draw_sprite_tiled(sprAwesomeShrimp, gameFrame/4, -px*m, -px*m);
	
	surface_reset_target();
}