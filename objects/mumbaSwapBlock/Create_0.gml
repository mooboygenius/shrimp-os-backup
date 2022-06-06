if live_call() return live_result;

event_inherited();

spawnX=x;
spawnY=y;

image_index=irandom(image_number);

drawScript=function(x, y) {
	if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
	draw_sprite(sprite_index, 1, x, y);
	draw_sprite(sprite_index, 0, x, y);
	shader_reset();
}