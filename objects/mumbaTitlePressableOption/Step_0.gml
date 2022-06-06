if live_call() return live_result;

event_inherited();

if active && (input(mumbaInputJump, PRESS) || input(mumbaInputFire, PRESS)) {
	pressScript();
	playMumbaSound(sfxMumbaMenuConfirm, 100, random_range(.9, 1.1));
}