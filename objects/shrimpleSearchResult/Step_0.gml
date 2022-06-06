if live_call() return live_result;

// Inherit the parent event
event_inherited();

drawScript=function(x, y) {
	//defaultDrawScript(x, y);
	var w=0;
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntMumbaShop);
	
	var tx=x-sprite_xoffset,
	ty=y-sprite_yoffset,
	nameWidth=string_width(name);
	w=max(w, nameWidth);
	var nc=hoveringOver ? nameHighlightColor : nameColor;
	draw_text_color(tx, ty, name, nc, nc, nc, nc, 1);
	ty+=string_height(name)-2;
	
	draw_set_font(fntSmaller);
	var urlWidth=string_width(url);
	w=max(w, urlWidth);
	draw_text_color(tx, ty, url, urlColor, urlColor, urlColor, urlColor, 1);
	ty+=string_height(url);
	
	draw_set_font(fntSmaller);
	var descWidth=GAME_WIDTH/2,
	descSep=string_height("A"),
	descTrueWidth=string_width_ext(description, descSep, descWidth);
	w=max(w, descTrueWidth);
	draw_text_ext_color(tx, ty, description, descSep, descWidth, descriptionColor, descriptionColor, descriptionColor, descriptionColor, 1);
	ty+=string_height_ext(description, descSep, descWidth);
	
	var h=(ty+sprite_yoffset)-y;
	image_xscale=w/sprite_get_width(sprite_index);
	image_yscale=h/sprite_get_height(sprite_index);
}