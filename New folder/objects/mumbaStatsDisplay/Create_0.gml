if live_call() return live_result;

event_inherited();
owner=noone;
fullText="";
drawScript=function(x, y) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntSystem);
	drawTextOutlinedGeneral(drawX, drawY, fullText, 16, GAME_WIDTH);
	var a=false;
	with owner {
		a=showUnlockText;
	}
	if a {
		var ty=drawY+string_height(fullText);
		drawTextOutlinedGeneral(drawX, ty, "HARD MODE + ENDLESS MODE UNLOCKED!!", 16, GAME_WIDTH, make_color_hsv((gameFrame*2)%255, 255, 255), BLACK_COLOR, 1, 1, 0, 1)
	}
}