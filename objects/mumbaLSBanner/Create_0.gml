if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	var xx=gameFrame/20+xOffset,
	yy=yOffset;
	draw_sprite_tiled_ext(sprite_index, image_index, xx, yy, 1, 1, c_white, 1);
	if yy>0 {
		draw_rectangle_color(0, 0, GAME_WIDTH, yy, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, false);
	} else if yy<0 {
		draw_rectangle_color(0, GAME_HEIGHT, GAME_WIDTH, GAME_HEIGHT+yy-4, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, false);
	}
}