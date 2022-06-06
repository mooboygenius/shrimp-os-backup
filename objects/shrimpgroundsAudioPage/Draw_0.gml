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
	notice="Also available on Shrimpify!\n\nUse SHRIMPOSER from www.shrimposer.shrimp to make your own music!",
	desc=description+notice,
	descSep=12,
	artDescriptionSpace=12,
	artPadDown=8,
	artBottom=artTop+artPadDown+artDescriptionSpace+40+string_height_ext(notice, descSep, descWidth)+4,
	artHeight=artBottom-artTop;
	
	drawShrimpgroundsWindow(artLeft, artTop, artWidth, artHeight, assetName);
	
	draw_set_font(fntSystem);
	
	var artX=(artLeft+artRight) div 2,
	artY=artTop+24+artPadDown;
	
	var descPad=8,
	descX=artLeft+descPad,
	descY=artBottom-string_height_ext(notice, descSep, descWidth)-8;
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var c=$3389FF;
	draw_text_ext_color(descX, descY, notice, descSep, descWidth, c, c, c, c, 1);
	
	var pauseX=artLeft+28,
	pauseY=artTop+32;
	with pauseButton {
		xstart=pauseX;
		ystart=pauseY;
		playTrack=other.myAudio;
	}
	
	var xo=sprite_get_xoffset(sprShrimpgroundsSliderBar),
	trackBarX=pauseX+sprite_get_xoffset(sprShrimpgroundsPauseButton)+xo+4;
	with trackBar {
		xstart=trackBarX;
		ystart=pauseY;
	}
	
	with slider {
		ystart=pauseY;
		var px=sprite_xoffset;
		leftMargin=trackBarX-xo+px;
		rightMargin=trackBarX+xo-px;
		if audio_is_playing(other.myAudio) && !audio_is_paused(other.myAudio) {
			currentTrackPosition=audio_sound_get_track_position(currentMusic);
		} else if !audio_is_playing(other.myAudio) {
			currentTrackPosition=0;
		}
		currentTrackLength=audio_sound_length(other.myAudio);
	}
	
	if surface_exists(childrenObjectSurf) {
		draw_surface(childrenObjectSurf, 0, 0);
	}
	
	scrollMinimum=-artBottom-20;
	
	surface_reset_target();
}