if live_call() return live_result;

event_inherited();

sprite=noone;
pieceName="";
authorName="";
descriptionText="";
myResource=sprShrimpgroundsZizouArt;

generateSubmission=function(name, author, description, resource, thumbnailSprite) {
	/// @function generateSubmission(name, author, description, resource, thumbnailSprite)
	
	var w=sprite_get_width(sprShrimpgroundsArtIcon),
	h=sprite_get_height(sprShrimpgroundsArtIcon),
	dx=w div 2,
	dy=h div 2,
	surf=surface_create(w, h);
	
	for (var i=0; i<sprite_get_number(sprShrimpgroundsArtIcon); i++) {
		surface_set_target(surf);
		draw_sprite(thumbnailSprite, 0, dx, dy-3);
		draw_sprite(sprShrimpgroundsArtIcon, i, dx, dy);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fntSmaller);
		var n=name,
		c=string_length(n);
		while string_width(n)>(w-8) {
			n=string_copy(name, 1, c)+"...";
			c--;
		}
		draw_text_color(dx, h-4, n, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, 1);
		surface_reset_target();
	
		if i==0 {
			sprite=sprite_create_from_surface(surf, 0, 0, w, h, false, false, w div 2, h div 2);
		} else if sprite_exists(sprite) {
			sprite_add_from_surface(sprite, surf, 0, 0, w , h, false, false);
		}
	}
	
	surface_free(surf);
	
	pieceName=name;
	authorName=author;
	descriptionText=description;
	myResource=resource;
	
	return sprite;
}