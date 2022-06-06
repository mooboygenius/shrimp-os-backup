if live_call() return live_result;
if DEV_MODE && input(vk_f1) {
	for (var xx=offsetX; xx<room_width; xx+=shiftX) {
		for (var yy=offsetY; yy<room_height; yy+=shiftY) {
			draw_sprite(sprDesktopHover, 0, xx, yy);
		}
	}
}
if hoveringOver {
	draw_sprite_ext(sprDesktopHover, 0, selectionBoxX, selectionBoxY, 1-squish, 1+squish, 0, c_white, 1);
}

if visible {
	var dx=x,
	dy=y;
	if hoveringOver dy+=wave(-2, 2, .5);
	if state==fileState.rename dy+=wave(-1, 1, 2);
	drawScript(dx, dy);
}