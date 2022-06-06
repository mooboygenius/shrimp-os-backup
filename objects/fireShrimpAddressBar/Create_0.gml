if live_call() return live_result;

event_inherited();

text="";

drawScript=function(x, y) {
	draw_self();
	var c=$734940;
	draw_set_font(fntSmaller);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	var tx=x+2,
	ty=y;
	draw_text_color(tx, ty, text, c, c, c, c, 1);
}

substate=0;