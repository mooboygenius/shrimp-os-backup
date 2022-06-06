if live_call() return live_result;

event_inherited();

if DEV_MODE && input(vk_f4, PRESS) {
	money+=10;
	updateData("mumbaMoney", money);
}