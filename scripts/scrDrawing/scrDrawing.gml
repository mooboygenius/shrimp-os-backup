function drawTextOutlinedGeneral(x, y, str, sep=9999, w=string_height("\n"), color=WHITE_COLOR, outlineColor=BLACK_COLOR, xScale=1, yScale=1, angle=0, thickness=1) {
	draw_set_color(outlineColor);
	if thickness>2 {
		var t=thickness-1;
		draw_text_ext_transformed(x+t, y+t, str, sep, w, xScale, yScale, angle);
		draw_text_ext_transformed(x-t, y+t, str, sep, w, xScale, yScale, angle);
		draw_text_ext_transformed(x+t, y-t, str, sep, w, xScale, yScale, angle);
		draw_text_ext_transformed(x-t, y-t, str, sep, w, xScale, yScale, angle);
	}
	draw_text_ext_transformed(x-thickness, y, str, sep, w, xScale, yScale, angle);
	draw_text_ext_transformed(x, y-thickness, str, sep, w, xScale, yScale, angle);
	draw_text_ext_transformed(x+thickness, y, str, sep, w, xScale, yScale, angle);
	draw_text_ext_transformed(x, y+thickness, str, sep, w, xScale, yScale, angle);
	draw_set_color(color);
	draw_text_ext_transformed(x, y, str, sep, w, xScale, yScale, angle);
	draw_set_color(c_white);
}

function drawTextOutlinedBasic(x, y, str, color=WHITE_COLOR, outlineColor=BLACK_COLOR, xScale=1, yScale=1, angle=0, thickness=1) {
	drawTextOutlinedGeneral(x, y, str, 9999, string_height("\n"), color, outlineColor, xScale, yScale, angle, thickness);
}