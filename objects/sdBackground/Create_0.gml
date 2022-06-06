if live_call() return live_result;

event_inherited();

drawScript=function(x, y, scale=1) {
	var dx=x,
	dy=y,
	o=scale-1;
	//dx+=sprite_get_xoffset(sprite_index)*o;
	//dy+=sprite_get_yoffset(sprite_index)*o;
	draw_sprite_tiled_ext(sprite_index, image_index, dx, dy, scale, scale, c_white, 1);
}

hasShadow=true;