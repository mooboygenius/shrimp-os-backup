if live_call() return live_result;

event_inherited();

if place_meeting(x, y, sdPlayer) {
	with sdPlayer {
		getHurt(1);
	}
	instance_destroy();
}

if x!=clamp(x, -GAME_WIDTH, GAME_WIDTH*2) || y!=clamp(y, -GAME_HEIGHT, GAME_HEIGHT*2) {
	instance_destroy();
}

if grace<-4 grace=1;