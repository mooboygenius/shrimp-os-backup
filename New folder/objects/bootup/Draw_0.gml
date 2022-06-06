if live_call() return live_result;
draw_set_font(fntBoot);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
var tx=4,
ty=tx;
if drawLines {
	for (var i=0; i<current; i++) {
		if i==clamp(i, 0, array_length(lines)-1) {
			draw_text(tx, ty, lines[i]);
			ty+=string_height(lines[i])+2;
		}
	}
}