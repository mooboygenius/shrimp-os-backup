if live_call() return live_result;

event_inherited();

grabScript=function() {
	defaultGrabScript();
	with sdPlayer {
		hp++;
	}
}
grabText="1 HP";