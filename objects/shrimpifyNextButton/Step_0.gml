if live_call() return live_result;

event_inherited();

clickFunction=function() {
	var i=currentMusicIndex+1;
	if i>=ds_list_size(songs) i=0;
	playMusicFromIndex(i);
}