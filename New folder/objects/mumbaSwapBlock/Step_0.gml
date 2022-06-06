if live_call() return live_result;
xstart=x;
ystart=y;

if swapped {
	x=-999;
	y=-999;
} else {
	if !place_meeting(spawnX, spawnY, mumbaLivingObject) {
		x=spawnX;
		y=spawnY;
	}
}

grace--;

drawScript=function(x, y) {
	if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
	var sx=spawnX, sy=spawnY;
	with parentWindow {
		sx+=drawXOffset;
		sy+=drawYOffset;
	}
	draw_sprite(sprite_index, 1, sx, sy);
	draw_sprite(sprite_index, 0, x, y);
	shader_reset();
}