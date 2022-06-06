if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	var w=72,
	h=portHeight,
	lightBlueColor=$C2A7A3;
	var by=8+scrollYLerp;
	draw_sprite_stretched(sprShritterLeftSideBar, 0, 0, 0, w, h);
	var rightBarX=portWidth-w-1;
	draw_sprite_stretched(sprShritterRightSideBar, 0, rightBarX, 0, w, h);
	draw_sprite_stretched(sprShritterHeader, 0, 0, by, portWidth, 24);
	draw_set_font(fntSystem);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var followersX=8,
	followersY=by+40;
	draw_text_color(followersX, followersY, "0\nFOLLOWERS\n\n0\nFOLLOWING", lightBlueColor, lightBlueColor, lightBlueColor, lightBlueColor, 1);
	
	draw_set_font(fntMumbaShop);
	var trendX=rightBarX+4,
	trendY=by+28;
	draw_text_ext_color(trendX, trendY, "Trending\nTopics", 12, 999, lightBlueColor, lightBlueColor, lightBlueColor, lightBlueColor, 1);
	trendY+=36;
	var sep=8, w=portWidth-trendX-4;
	draw_set_font(fntBoot);
	for (var i=0; i<ds_list_size(activeTrends); i++) {
		var str=activeTrends[| i];
		draw_text_ext_color(trendX, trendY, str, sep, w, lightBlueColor, lightBlueColor, lightBlueColor, lightBlueColor, 1);
		trendY+=string_height_ext(str, sep, w)+8;
	}
	
	var postsY=by+28,
	postsX=portWidth div 2;
	for (var i=0; i<ds_list_size(posts); i++) {
		with posts[| i] {
			postsY+=sprite_yoffset;
			xstart=postsX;
			ystart=postsY;
			postsY+=sprite_yoffset+4;
		}
	}
	
	draw_surface(childrenObjectSurf, 0, 0);
	
	surface_reset_target();
	
	scrollMinimum=-540;
}