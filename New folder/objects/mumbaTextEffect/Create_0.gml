//if live_call() return live_result;

event_inherited();

surf=-1;
width=0;
height=0;

generateText=function(str, c=c_white, oc=BLACK_COLOR, f=fntSystem) {
	/// @function generateText(string, color, outlineColor, [font])
	draw_set_font(f);
	
	if surface_exists(surf) surface_free(surf);
	
	width=string_width(str)+2;
	height=string_height(str)+2;
	
	surf=surface_create(width, height);
	surface_set_target(surf);
	draw_clear_alpha(0, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	drawTextOutlinedBasic(1, 1, str, c, oc);
	surface_reset_target();
}

generateText("test", c_white, BLACK_COLOR);

drawScript=function(x, y) {
	if surface_exists(surf) {
		draw_surface_ext(surf, x-width/2, y-height/2, xScale+squish, yScale-squish, angle, c_white, 1);
	}
}