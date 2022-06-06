if live_call() return live_result;

event_inherited();

drawX=getMouseX();
drawY=getMouseY();

timeSinceLiftingPencil++;

var inDrawingArea=false;

if surface_exists(drawSurf) {
	surface_set_target(drawSurf);
	//draw_clear_alpha(c_white, 1);
	var left=portX+barWidth,
	top=portY,
	right=left+portWidth-barWidth,
	bottom=top+portHeight;
	if point_in_rectangle(drawX, drawY, left, top, right, bottom) && HIGHEST_INSTANCE_UNDER_MOUSE==id {
		inDrawingArea=true;
		with cursor drawing=true;
		var x1=drawX-portX-barWidth,
		y1=drawY-portY,
		x2=drawPreviousX-portX-barWidth,
		y2=drawPreviousY-portY;
		if input(mb_left) {
			show_debug_message("drawing");
			if timeSinceLiftingPencil<5 {
				draw_circle_color(x1, y1, drawSize/2, drawColor, drawColor, false);
				draw_line_width_color(x1, y1, x2, y2, drawSize, drawColor, drawColor);
				draw_circle_color(x2, y2, drawSize/2, drawColor, drawColor, false);
			} else {
				draw_circle_color(x1, y1, drawSize/2, drawColor, drawColor, false);
			}
			drawPreviousX=drawX;
			drawPreviousY=drawY;
			timeSinceLiftingPencil=0;
		}
	}
	surface_reset_target();
	//show_debug_message("hi");
} else {
	drawSurf=surface_create(drawCanvasWidth, drawCanvasHeight);
	surface_set_target(drawSurf);
	draw_clear_alpha(c_white, 1);
	surface_reset_target();
}

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha($996F68, 1);
	var c=$996F68;
	draw_set_font(fntSmaller);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_sprite_stretched(sprPaintBar, 0, 0, 0, barWidth, portHeight);
	draw_text_color(0, 0, "colorz", c, c, c, c, 1);
	if surface_exists(childrenObjectSurf) draw_surface(childrenObjectSurf, 0, 0);
	if surface_exists(drawSurf) draw_surface(drawSurf, barWidth, 0);
	if inDrawingArea {
		var mx=drawX-portX,
		my=drawY-portY;
		draw_circle_color(mx, my, drawSize/2, drawColor, drawColor, false);
	}
	surface_reset_target();
}