if live_call() return live_result;
event_inherited();

stickToWindow();

drawScript=function(x, y) {
	var gf=-gameFrame/3,
	tx=x+gf,
	ty=y+gf;
	draw_sprite_tiled(sprite_index, 0, tx, ty);
}