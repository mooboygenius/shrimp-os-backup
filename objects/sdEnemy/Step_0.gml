if live_call() return live_result;

event_inherited();

hurtEffect--;

if hurtPlayerOnTouch {
	if place_meeting(x, y, sdPlayer) {
		with sdPlayer {
			getHurt(1);
		}
	}
}

if DEV_MODE && input(vk_f1, PRESS) instance_destroy(); 