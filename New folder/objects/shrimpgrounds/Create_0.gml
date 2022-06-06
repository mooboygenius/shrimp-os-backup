if live_call() return live_result;

// Inherit the parent event
event_inherited();

drawShrimpgroundsWindow=function(x, y, w, h, n="") {
	/// @function drawShrimpgroundsWindow(x, y, width, height, [name])
	var spr=sprShrimpgroundsNoNameWindow;
	if n!="" spr=sprShrimpgroundsWindow;
	draw_sprite_stretched(spr, 0, x, y, w, h);
	if n!="" {
		draw_set_font(fntSmaller);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text_color(x+2, y+1, n, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, 1);
	}
}

makeSubmission=function(name, author, description, resource, thumbnailSprite) {
	/// @function makeSubmission(name, author, description, resource, thumbnailSprite)
	var map=ds_map_create();
	map[? "name"]=name;
	map[? "author"]=author;
	map[? "description"]=description;
	map[? "resource"]=resource;
	map[? "thumbnailSprite"]=thumbnailSprite;
	return map;
}

shrimpgroundsHomeButton=instance_create_depth(-100, -100, depth-20, shrimpgroundsLogo);
ds_list_add(children, shrimpgroundsHomeButton);