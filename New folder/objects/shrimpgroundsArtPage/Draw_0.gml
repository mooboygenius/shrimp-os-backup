if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	var left=48, right=GAME_WIDTH-left,
	top=scrollYLerp+36,
	authorPull=32,
	authorLeft=left-authorPull,
	authorWidth=62+authorPull,
	authorHeight=32,
	authorRight=authorLeft+authorWidth,
	authorTop=top,
	authorBottom=authorTop+authorHeight;
	
	drawShrimpgroundsWindow(authorLeft, authorTop, authorWidth, authorHeight, "Created by:");
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntSystem);
	var authorNameX=authorLeft+2,
	authorNameY=authorTop+12,
	c=$3389FF;
	draw_text_color(authorNameX, authorNameY, author, c, c, c, c, 1);
	
	var artLeft=authorRight+4,
	artRight=right,
	artWidth=artRight-artLeft,
	artTop=top,
	descWidth=artWidth,
	notice="\n\n\nUse SHRIMP PAINT\nfrom www.paint.shrimp\nto make your own art!",
	desc=description+notice,
	descSep=12,
	artDescriptionSpace=12,
	artPadDown=(artWidth-sprite_get_width(art)) div 2+7,
	artBottom=artTop+artPadDown+sprite_get_height(art)+artDescriptionSpace+string_height_ext(description, descSep, descWidth)+string_height_ext(notice, descSep, descWidth)+4,
	artHeight=artBottom-artTop;
	
	drawShrimpgroundsWindow(artLeft, artTop, artWidth, artHeight, assetName);
	
	draw_set_font(fntSystem);
	
	var artX=(artLeft+artRight) div 2,
	artY=artTop+sprite_get_yoffset(art)+artPadDown;
	draw_sprite(art, 0, artX, artY);
	
	var descPad=8,
	descX=artLeft+descPad,
	descY=artY+sprite_get_yoffset(art)+artDescriptionSpace;
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext_color(descX, descY, description, descSep, descWidth, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, WHITE_COLOR, 1);
	descY+=string_height_ext(description, descSep, descWidth);
	var c=$3389FF;
	draw_text_ext_color(descX, descY, notice, descSep, descWidth, c, c, c, c, 1);
	
	
	//show_debug_message(right-left);
	
	scrollMinimum=-artBottom-20;
	
	surface_reset_target();
}