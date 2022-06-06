if live_call() return live_result;

if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);

#region variable setup
var bx=border[borders.left][0]+(windowWidth-windowWidth*windowScale)/2,
by=border[borders.top][0]+(windowHeight-windowHeight*windowScale)/2;
portX=bx+3;
portY=floor(by+10);
#endregion

#region window frame
drawScript(bx, by);
#endregion

#region final surface
if !surface_exists(storeFinalSurf) {
	storeFinalSurf=surface_create(portWidth, portHeight);
}

if surface_exists(finalSurf) {
	var surfToDraw=finalSurf;
	
	if surface_exists(storeFinalSurf) {
		if portWidth!=oldPortWidth || portHeight!=oldPortHeight {
			oldPortWidth=portWidth;
			oldPortHeight=portHeight;
			surface_resize(finalSurf, portWidth, portHeight);
			surfToDraw=storeFinalSurf;
		} else {
			if surface_get_width(storeFinalSurf)!=portWidth || surface_get_height(storeFinalSurf)!=portHeight {
				surface_resize(storeFinalSurf, portWidth, portHeight);
			}
			surface_copy(storeFinalSurf, 0, 0, finalSurf);
		}
	}
	
	draw_surface_stretched(surfToDraw, portX, portY, portWidth*windowScale, portHeight*windowScale);
	
	surface_set_target(finalSurf);
	draw_clear_alpha(0, 0);
	surface_reset_target();
} else {
	finalSurf=surface_create(portWidth, portHeight);
}
#endregion

#region children object surface
if surface_exists(childrenObjectSurf) {
	surface_resize(childrenObjectSurf, portWidth, portHeight);
	
	surface_set_target(childrenObjectSurf);
	
	draw_clear_alpha(0, 0);
	
	if ds_exists(children, ds_type_list) {
		for (var i=0; i<ds_list_size(children); i++) {
			with children[| i] {
				var dx=xstart+other.drawXOffset, dy=ystart+other.drawYOffset;
				if forceDraw || rectangle_in_rectangle(0, 0, other.portWidth, other.portHeight, dx-sprite_xoffset, dy-sprite_yoffset, dx+sprite_xoffset, dy+sprite_yoffset) {
					drawScript(dx, dy);
				}
			}
		}
	}
	
	surface_reset_target();
	
} else {
	childrenObjectSurf=surface_create(portWidth, portHeight);
}
#endregion

#region background surface
if surface_exists(backgroundSurface) {
	surface_resize(backgroundSurface, portWidth, portHeight);
	surface_set_target(backgroundSurface);
	draw_clear_alpha(0, 0);
	var t=current_time/100;
	draw_sprite_tiled(sprWindowBackground, 0, t, t);
	surface_reset_target();
} else {
	backgroundSurface=surface_create(portWidth, portHeight);
}
#endregion

#region window name
draw_set_font(fntSmaller);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var tx=ceil(x+3), ty=ceil(y+1),
c=nameColor;
draw_text_transformed_color(tx, ty, name, windowScale, 1, 0, c, c, c, c, 1);
#endregion

shader_reset();