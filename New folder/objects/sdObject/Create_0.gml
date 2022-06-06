if live_call() return live_result;

// Inherit the parent event
event_inherited();

drawScript=function(x, y, scale=1) {
	/// @function defaultDrawScript(x, y, [scale])
	var dx=x,
	dy=y,
	dxs=image_xscale*xScale*scale,
	dys=image_yscale*yScale*scale,
	dang=angle+image_angle;
	if squish>.1 || squish<-.1 {
		dxs+=sign(dxs)*squish;
		dys-=sign(dys)*squish;
	}
	if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
	draw_sprite_ext(sprite_index, image_index, dx, dy, dxs, dys, dang, image_blend, image_alpha);
	if grace>0 shader_reset();
}