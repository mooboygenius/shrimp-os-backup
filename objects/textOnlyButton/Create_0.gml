if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	//defaultDrawScript(x, y);
	//buttonDrawScript(x, y);
	draw_set_font(font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	var c=unselectColor;
	if image_index c=selectColor;
	draw_text_color(x, y+1+image_index, text, c, c, c, c, 1);
}