if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	
	draw_clear_alpha(0, 0);
	
	draw_sprite_stretched(sprShteamBackground, 0, 0, 0, portWidth, portHeight);
	
	var lx=portWidth div 2-sprite_get_width(sprShteamLogo)/2,
	ly=20+wave(-2, 2, 3)+scrollYLerp;
	draw_sprite(sprShteamLogo, 0, lx, ly);
	
	var mumbaX=portWidth div 2,
	mumbaY=ly+48;
	draw_sprite(sprUgbyMumbaBrowserThumbnail, 0, mumbaX, mumbaY);
	
	var nowAvailableX=mumbaX+70,
	nowAvailableY=round(mumbaY+10);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fntMumbaShop);
	drawTextOutlinedGeneral(nowAvailableX, nowAvailableY, "Now available!", 12, 999, $5DD4C8, BLACK_COLOR, 1.5, 1.5, 5, 2);
	
	spr=[sprDeadEstateThumbnail, sprShootTripDieThumbnail, sprMadSistersThumbnail, sprEarthDiedScreamingThumbnail, sprUgbyMumba3Thumbnail, sprShalsGameThumbnail];
	
	var descY=120+scrollYLerp,
	descX=portWidth div 2;
	draw_set_font(fntSystem);
	draw_set_valign(fa_top);
	draw_text_color(descX, descY, "Shteam is the #1 shrimp-oriented\ngaming platform ever.\n\nDownload it now.", WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, 1);
	
	with downloadButton {
		sprite_index=sprShteamButton;
		selectColor=WHITE_COLOR;
		xstart=descX;
		ystart=descY+88;
		depth=other.depth-10;
	}
	
	var tx=0,
	ty=310-52+scrollYLerp;
	for (var i=0; i<array_length(spr); i++) {
		var xo=sprite_get_width(spr[i])*2;
		tx=(gameFrame/2+i*72)%(GAME_WIDTH+xo)-xo;
		draw_sprite(spr[i], 0, tx, ty);
	}
	
	if surface_exists(childrenObjectSurf) {
		draw_surface(childrenObjectSurf, 0, 0);
		show_debug_message("gay");
	}
	
	surface_reset_target();
}