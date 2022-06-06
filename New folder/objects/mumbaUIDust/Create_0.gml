if live_call() return live_result;

event_inherited();

drawX=0;
drawY=0;

drawScript=function(x, y) {
	if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
	draw_sprite_ext(sprite_index, image_index, drawX, drawY, xScale, yScale, angle, c_white, 1);
	shader_reset();
}
angle=random(90);
xScale=random_range(1, 1.6);
yScale=xScale;
shrinkSpeed=random_range(.025, .05);
turnSpeed=random_range(.9, 2);
yMove=random_range(.8, 1.2);
xMove=yMove*random_range(.08, .15);
squish=random_range(-.2, .2);
grace=irandom_range(3, 9);