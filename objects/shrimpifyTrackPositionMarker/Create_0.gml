if live_call() return live_result;

event_inherited();

leftMargin=0;
rightMargin=1;
currentTrackPosition=0;
currentTrackLength=-1;
holding=false;

clickFunction=function() {
	show_debug_message("aww");
	holding=true;
	audio_pause_sound(currentMusic);
}

gotoX=xstart;