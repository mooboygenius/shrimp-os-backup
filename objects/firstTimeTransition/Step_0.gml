if live_call() return live_result;
timer++;
if timer>120 {
	updateData("beenThroughSetup", true);
	saveGame();
	room_goto(rmTest);
}