if live_call() return live_result;
event_inherited();
myIndex=-1;
surf=-1;
sprite=noone;

generateSprite=function() {
	/// @function generateSprite();
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var w=80,
	h=20,
	nameX=24,
	nameY=0,
	nameC=c_white,
	artistX=24,
	artistY=12,
	artistC=make_color_rgb(163, 167, 194);
	if isPlaying {
		nameC=make_color_rgb(99, 171, 63);
	}
	draw_set_font(fntShrimpcordUsername);
	var nameWidth=string_width(name);
	draw_set_font(fntSmaller);
	var artistWidth=string_width(artist);
	var w=max(artistX+artistWidth, nameX+nameWidth);
	surf=surface_create(w, h);
	if surface_exists(surf) {
		if surface_get_width(surf)!=w || surface_get_height(surf)!=h {
			surface_resize(surf, w, h);
		}
		surface_set_target(surf);
		draw_clear_alpha(0, 0);
		//draw_rectangle_color(1, 1, w-2, h-2, c_red, c_red, c_red, c_red, true);
		draw_sprite_stretched(art, 0, 0, 0, h, h);
		draw_set_font(fntShrimpcordUsername);
		draw_text_color(nameX, nameY, name, nameC, nameC, nameC, nameC, 1);
		draw_set_font(fntSmaller);
		draw_text_color(artistX, artistY, artist, artistC, artistC, artistC, artistC, 1);
		surface_reset_target();
		draw_surface(surf, x-sprite_width/2, y-sprite_height/2);
	}
	sprite=sprite_create_from_surface(surf, 0, 0, w, h, false, false, 0, 0);
	sprite_collision_mask(sprite, false, 1, 0, 0, w, h, bboxkind_rectangular, 255);
	sprite_index=sprite;
	mask_index=sprite;
	image_xscale=1;
	image_yscale=1;
}

generateSprite();