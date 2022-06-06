if live_call() return live_result;

event_inherited();

clickFunction=function() {
	var i=currentMusicIndex-1;
	if i<0 i=ds_list_size(songs)-1;
	playMusicFromIndex(i);
}