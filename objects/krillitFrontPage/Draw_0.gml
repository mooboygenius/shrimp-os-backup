if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	var dy=42;
	for (var i=0; i<ds_list_size(posts); i++) {
		with posts[| i] {
			width=248;
			xstart=sprite_xoffset+1;
			ystart=dy+other.scrollYLerp+sprite_yoffset;
			dy+=sprite_height+2;
		}
	}
	scrollMinimum=-420;
	surface_reset_target();
}