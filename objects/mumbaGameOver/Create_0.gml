if live_call() return live_result;

event_inherited();

state=0;
timer=0;
text=choose("R.I.P bozo", "You died!", "You got killed!", "R.I.P", "L", "You're dead meat.", "Get well soon.", "Try harder.", "What a shame!", "SAD!");
text+=concat("\n\n[", getStringFromInput(mumbaInputFire), "] to try again,\n\n[ESC] to quit")
show=false;
circle=noone;

drawScript=function(x, y) {
	if show {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fntSystem);
		drawTextOutlinedGeneral(GAME_WIDTH div 2, GAME_HEIGHT div 2, text);
	}
}