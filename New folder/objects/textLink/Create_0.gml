if live_call() return live_result;
event_inherited();
spriteWidth=sprite_get_width(sprite_index);
spriteHeight=sprite_get_height(sprite_index);
drawScript=function(x, y) {
	var c=normalColor;
	if image_index {
		c=selectedColor;
	}
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
	var tx=x,
	ty=y;
	width=string_width(text);
	height=string_height(text);
	image_xscale=width/spriteWidth;
	image_yscale=height/spriteHeight;
	switch halign {
		case fa_left:
			tx-=width/2;
		break;
		
		case fa_right:
			tx+=width/2;
		break;
	}
	
	switch valign {
		case fa_top:
			ty-=height/2;
		break;
		
		case fa_bottom:
			ty+=height/2;
		break;
	}
	if input(vk_f3) defaultDrawScript(x, y);
	draw_text_color(tx, ty, text, c, c, c,c, 1);
}

clickFunction=function() {
	var str=concat("www.", string_lettersdigits(string_lower(text)), ".shrimp");
	with parentWindow {
		var inst=shrimpNotFound;
		if ds_map_find_value(realWebsites, str) {
			inst=realWebsites[? str][? "object"];
		}
		with createNewPage(inst) {
			urlBar.text=str;
		}
	}
}