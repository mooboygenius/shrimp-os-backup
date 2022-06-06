if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	draw_clear_alpha(BLACK_COLOR, 1);
}

darknessSurface=-1;
darknessSurface=surface_create(GAME_WIDTH, GAME_HEIGHT);
forceDraw=true;