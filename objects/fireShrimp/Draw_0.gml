if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(WHITE_COLOR, 1);
	surface_reset_target();
}

var h=11;
draw_sprite_stretched(sprFireShrimpTopBar, 0, x+3, y+8, portWidth, h);