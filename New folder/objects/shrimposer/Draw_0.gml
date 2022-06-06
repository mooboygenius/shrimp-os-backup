if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(c_white, 1);
	
	var backgroundX=10+scrollAmountLerp;
	draw_sprite_tiled(sprShrimposerBackground, 0, backgroundX, 0);
	
	var barY=sprite_get_height(sprNoteRoll),
	barHeight=portHeight-barY;
	draw_sprite_stretched(sprShrimposerUIBar, 0, 0, barY, portWidth, barHeight);
	
	var sx=6,
	sy=barY+7;
	for (var i=0; i<ds_list_size(selections); i++) {
		with selections[| i] {
			xstart=sx;
			ystart=sy;
		}
		sx+=11;
	}
	
	with mouseInstrument {
		lerpX=getMouseX()-other.portX;
		lerpY=getMouseY()-other.portY;
		var offsetX=0,
		offsetY=3,
		shiftX=6,
		shiftY=7;
		lerpX=round((lerpX-offsetX)/shiftX)*shiftX+offsetX;
		lerpY=round((lerpY-offsetY)/shiftY)*shiftY+offsetY;
		topBorder=0;
		leftBorder=sprite_get_width(sprNoteRollLabel);
		bottomBorder=barY;
		rightBorder=other.portWidth;
	}
	
	with playButton {
		xstart=8;
		ystart=sy+13;
		depth=other.depth-20;
	}
	
	with scrollBar {
		ystart=sy+14;
		xstart=52;
		depth=other.depth-20;
	}
	
	if surface_exists(childrenObjectSurf) draw_surface(childrenObjectSurf, 0, 0);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntSystem);
	var c=c_red;
	//draw_text_color(2, 2, concat("fps: ", fps, "\nfps real: ", fps_real), c, c, c, c, 1);
	
	draw_sprite(sprNoteRollLabel, 0, 0, 0); 
	
	surface_reset_target();
}