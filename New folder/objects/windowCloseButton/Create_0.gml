if live_call() return live_result;

event_inherited();

clickFunction=function() {
	with parentWindow {
		state=windowStates.close;
	}
}