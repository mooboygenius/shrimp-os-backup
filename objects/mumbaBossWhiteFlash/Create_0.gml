if live_call() return live_result;

event_inherited();
forceDraw=true;
drawScript=function(x, y) {
	draw_set_alpha(fade);
	var left=-10, top=-10, right=GAME_WIDTH*2, bottom=GAME_HEIGHT*2;
	with mumbaLevel {
		left=-10;
		top=-10;
		right=tileSurfaceWidth+10;
		bottom=tileSurfaceHeight+10;
	}
	draw_rectangle_color(left, top, right, bottom, c_white, c_white, c_white, c_white, false);
	draw_set_alpha(1);
}