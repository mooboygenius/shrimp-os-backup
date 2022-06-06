if live_call() return live_result;

event_inherited();

drawScript=function(dx, dy) {
	with mumbaLSObject {
		var xs=(sprite_width/other.shadowWidth)*shadowSize,
		ys=xs*.3,
		xx=x,
		yy=y+sprite_yoffset;
		with parentWindow {
			xx+=drawXOffset;
			yy+=drawYOffset;
		}
		draw_sprite_ext(sprLevelSelectShadow, 0, xx, yy, xs, ys, 0, c_white, 1);
	}
}