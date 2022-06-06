if live_call() return live_result;

if showAll {
	draw_set_font(shrimpDefenderFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	var cx=GAME_WIDTH div 2,
	cy=GAME_HEIGHT/2-40,
	yo=48,
	ct="shrimp defender\nmission complete";
	if showClearedMessage draw_text(cx, cy, ct);
	var p=128;
	draw_set_halign(fa_left);
	cy+=yo;
	var jx=cx-p;
	if showJack draw_text(jx, cy, "programming and art\nby jack");
	draw_set_halign(fa_right);
	var chx=cx+p;
	if showChris draw_text(chx, cy, "music by\nheyopc");
	cy+=yo;
	draw_set_halign(fa_center);
	if showPrompt draw_text(cx, cy, "worm cleared from system\nit is now safe to restart");
}