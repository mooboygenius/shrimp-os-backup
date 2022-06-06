if live_call() return live_result;
// Inherit the parent event
event_inherited();

if holding {
	show_debug_message("holding");
	gotoX+=getMouseX()-previousMouseX;
	if input(mb_left, RELEASE) {
		holding=false;
		audio_sound_set_track_position(currentMusic, (gotoX-leftMargin)/(rightMargin-leftMargin)*currentTrackLength);
		currentTrackPosition=(gotoX-leftMargin)/(rightMargin-leftMargin)*currentTrackLength;
		audio_resume_sound(currentMusic);
	}
	image_index=1;
} else {
	gotoX=lerp(leftMargin, rightMargin, currentTrackPosition/currentTrackLength);
}

xstart=clamp(lerp(xstart, gotoX, .5), leftMargin, rightMargin);