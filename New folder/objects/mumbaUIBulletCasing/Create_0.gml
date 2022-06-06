if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
	draw_sprite_ext(sprite_index, image_index, drawX, drawY, xScale, yScale, angle, c_white, 1);
	shader_reset();
}

grace=irandom_range(3, 5);
squish=random_range(-1, 1)*.25;
angle=random(360);

life=60;