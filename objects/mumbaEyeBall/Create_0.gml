if live_call() return live_result;

event_inherited();

lookDirection=0;

drawScript=function(x, y) {
	draw_sprite_ext(sprite_index, image_index, x, y, xScale*image_xscale, yScale*image_yscale-squish, angle, c_white, 1);
	if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
	var px=x+lengthdir_x(4*image_xscale, lookDirection),
	py=y+lengthdir_y(4*image_yscale, lookDirection);
	draw_sprite_ext(sprBossEyePupil, image_index, px, py, xScale*image_xscale+squish, yScale*image_yscale-squish, angle, c_white, 1);
	shader_reset();
}

playedSound=false;