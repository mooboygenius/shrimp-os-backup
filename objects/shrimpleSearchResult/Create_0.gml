if live_call() return live_result;

event_inherited();

name="";
description="";
url="";

drawScript=function(x, y) {
	defaultDrawScript(x, y);
	var w=0;
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntSystem);
	
	var tx=x,
	ty=y,
	nameWidth=string_width(name);
	w=max(w, nameWidth);
	var nc=hoveringOver ? nameHighlightColor : nameColor;
	draw_text_color(tx, ty, name, nc, nc, nc, nc, 1);
	ty+=string_height(name);
	
	draw_set_font(fntSmaller);
	var urlWidth=string_width(url);
	w=max(w, urlWidth);
	draw_text_color(tx, ty, url, urlColor, urlColor, urlColor, urlColor, 1);
	ty+=string_height(url);
	
	draw_set_font(fntMumba);
	var descWidth=max(nameWidth, urlWidth),
	descSep=12,
	descTrueWidth=string_width_ext(description, descSep, descWidth);
	w=max(w, descTrueWidth);
	draw_text_color(tx, ty, description, descriptionColor, descriptionColor, descriptionColor, descriptionColor, 1);
	ty+=string_height_ext(description, descSep, descWidth);
	
	var h=ty-y;
	image_xscale=w/sprite_get_width(sprite_index);
	image_yscale=h/sprite_get_height(sprite_index);
}

clickFunction=function() {
	var inst=noone;
	
	if ds_map_exists(realWebsites, url) {
		inst=realWebsites[? url][? "object"];
	}
	
	if inst {
		with parentWindow {
			createNewPage(inst);
		}
	}
}

nameColor=$996F68;
nameHighlightColor=$C2A7A3;
descriptionColor=nameHighlightColor;
urlColor=$5DD4C8;