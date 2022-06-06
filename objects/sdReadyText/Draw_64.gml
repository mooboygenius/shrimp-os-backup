if live_call() return live_result;

with sdPlayer {
	if surface_exists(uiSurface) {
		surface_set_target(uiSurface);
		
		draw_set_font(shrimpDefenderFont);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		var dx=GAME_WIDTH div 2,
		dy=GAME_HEIGHT div 2,
		dt="ROUND START";
		if timer>60 || timer%4>2 {
			draw_text_color(dx, dy, dt, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, 1);
		}
		
		surface_reset_target();
	}
}