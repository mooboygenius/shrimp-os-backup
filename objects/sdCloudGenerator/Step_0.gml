if live_call() return live_result;

timer--;
if timer<=0 {
	timer=irandom_range(40, 150);
	instance_create_depth(-48, irandom_range(-48, GAME_HEIGHT-48), -100, sdCloud);
}