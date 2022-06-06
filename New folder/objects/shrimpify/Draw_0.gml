if live_call() return live_result;
// Inherit the parent event
event_inherited();

var highlightColor=$B8A44F,
pw=portWidth,
ph=portHeight;

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_surface(childrenObjectSurf, 0, 0);
	
	var trackLeft=0,
	trackRight=portWidth,
	trackY=ph-4;
	with trackBar {
		xstart=pw div 2;
		ystart=trackY;
		image_xscale=1.5;
		trackLeft=xstart-sprite_xoffset;
		trackRight=xstart+sprite_xoffset;
	}
	
	with trackPositionMarker {
		ystart=trackY;
		leftMargin=trackLeft;
		rightMargin=trackRight;
		currentTrackPosition=other.currentTrackPosition;
		currentTrackLength=other.currentTrackLength;
	}
	
	var pauseY=ph-20,
	pauseX=pw div 2;
	with pauseButton {
		xstart=pauseX;
		ystart=pauseY;
	}
	
	var o=20;
	with nextButton {
		xstart=pauseX+o;
		ystart=pauseY;
	}
	
	with previousButton {
		xstart=pauseX-o;
		ystart=pauseY;
	}
	
	with coolRectangle {
		xstart=0;
		ystart=ph-34;
		image_xscale=other.portWidth;
		image_yscale=other.portHeight-ystart;
		image_blend=make_color_rgb(40, 53, 64);
		depth=other.depth+10;
	}
	var ly=ph-34;
	draw_line_color(0, ly, portWidth, ly, highlightColor, highlightColor);
	var spr=noone;
	if ds_list_find_value(songs, currentMusicIndex) {
		spr=getSongArt(currentMusicIndex);
	}
	if spr!=noone {
		var imgy=ly+1;
		var s=portHeight-imgy;
		draw_sprite_stretched(spr, 0, 0, imgy, s, s);
	}
	
	surface_reset_target();
}