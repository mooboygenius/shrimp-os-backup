if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	var left=48, right=GAME_WIDTH-left,
	datesX=left,
	datesY=36+scrollYLerp,
	datesWidth=64,
	bannerPad=12,
	datesHeight=sprite_get_height(sprShrimpgroundsBannerPost)+bannerPad;
	drawShrimpgroundsWindow(datesX, datesY, datesWidth, datesHeight, "Cool Dates");
	
	var dates=["Pico Day\nApril 30", "Pico Day 2\nJune 11", "Halloween\nOct. 31", "Chrimmus\nDec. 25"];
	draw_set_font(fntBoot);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var dy=datesY+12,
	dx=datesX+3,
	dc=WHITE_COLOR;
	for (var i=0; i<array_length(dates); i++) {
		draw_text_color(dx, dy, dates[i], dc, dc, dc, dc, 1);
		dy+=string_height(dates[i])+6;
	}
	
	var bannerX=datesX+datesWidth+2,
	bannerY=datesY,
	bannerPad=12,
	bannerWidth=right-bannerX,
	bannerSpriteWidth=sprite_get_width(sprShrimpgroundsBannerPost),
	bannerHeight=datesHeight;
	drawShrimpgroundsWindow(bannerX, bannerY, bannerWidth, bannerHeight);
	draw_sprite(sprShrimpgroundsBannerPost, 0, bannerX+(bannerWidth-bannerSpriteWidth)/2, bannerY+bannerPad/2);
	
	var artHeight=64,
	artY=bannerY+bannerHeight+4,
	artX=left,
	artWidth=right-left;
	drawShrimpgroundsWindow(artX, artY, artWidth, artHeight, "Featured Art");
	
	var submissionPad=6,
	submissionStart=left+submissionPad+1,
	submissionX=submissionStart,
	submissionY=artY+34;
	for (var i=0; i<ds_list_size(featuredArt); i++) {
		with featuredArt[| i] {
			submissionX+=sprite_xoffset;
			xstart=submissionX;
			ystart=submissionY;
			submissionX+=sprite_xoffset+submissionPad;
		}
	}
	
	var audioHeight=artHeight,
	audioY=artY+artHeight+4,
	audioX=left,
	audioWidth=artWidth;
	drawShrimpgroundsWindow(audioX, audioY, audioWidth, audioHeight, "Featured Audio");
	submissionX=submissionStart
	submissionY=audioY+34;
	for (var i=0; i<ds_list_size(featuredAudio); i++) {
		with featuredAudio[| i] {
			submissionX+=sprite_xoffset;
			xstart=submissionX;
			ystart=submissionY;
			submissionX+=sprite_xoffset+submissionPad;
		}
	}
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fntSystem);
	draw_text_color(portWidth div 2, audioY+audioHeight+32, "bobinga poop fart", WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, 1);
	
	if surface_exists(childrenObjectSurf) draw_surface(childrenObjectSurf, 0, 0);
	
	surface_reset_target();
}