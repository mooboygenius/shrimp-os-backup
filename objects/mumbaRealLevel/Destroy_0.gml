if live_call() return live_result;

event_inherited();

if won {
	unlockMedal(clearMedalName);
	if hardModeOn {
		unlockMedal(hardMedalName);
		updateData(concat(winLevelName, "ClearedHardMode"), true);
	}
	if playerIsAtFullHealth {
		show_debug_message("player is at full hp");
		unlockMedal(perfectMedalName);
		updateData(concat(winLevelName, "Perfect"), true);
	}
	saveGame();
}