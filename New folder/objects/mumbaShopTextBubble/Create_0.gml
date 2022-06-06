if live_call() return live_result;

event_inherited();

text="test text woohoo. line break";
copy=0;
copySpeed=1;
writtenAmount=0;
written="";

parseText=function(str) {
	/// @function parseText(str)
	// insert breaks
	var char="", previousChar="",
	t="";
	for (var i=1; i<=string_length(str); i++) {
		char=string_char_at(str, i);
	
		if char==" " && (previousChar=="." || previousChar=="!" || previousChar=="?") {
			t+="\n";
		} else {
			t+=char;
		}
	
		previousChar=char;
	}
	return t;
}

drawScript=function(x, y) {
	var m=.2,
	int=.004;
	setWaveShader(sprite_width*m, sprite_height*m, int, int, (gameFrame div 10)*100)
	defaultDrawScript(drawX, drawY);
	shader_reset();
	var txo=16,
	tx=drawX+txo,
	ty=drawY-sprite_height+12,
	sep=12,
	w=200,
	c=BLACK_COLOR;
	draw_set_font(mumbaShopFont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext_transformed_color(tx, ty, written, sep, w, 1, 1, 0, c, c, c, c, 1);
	
	var w=sprite_get_width(sprite_index);
	image_xscale=lerp(image_xscale, (max(w, string_width(text)+txo*2))/w, .5);
}

text=parseText(text);