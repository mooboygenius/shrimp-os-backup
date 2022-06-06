if live_call() return live_result;

defaultDrawScript=function(x, y) {
	/// @function defaultDrawScript(x, y)
	var dx=floor(x),
	dy=floor(y),
	dxs=image_xscale*xScale,
	dys=image_yscale*yScale,
	dang=angle+image_angle;
	dxs+=sign(dxs)*squish;
	dys-=sign(dys)*squish;
	if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
	draw_sprite_ext(sprite_index, image_index, dx, dy, dxs, dys, dang, image_blend, image_alpha);
	shader_reset();
}

drawScript=function(x, y) {
	/// @function drawScript(x, y)
	defaultDrawScript(x, y);
}

drawShadowScript=function(x, y) {
	/// @function drawShadowScript(x, y)
	drawScript(x, y);
}

uniqueRightClickMenuOptions=-1;