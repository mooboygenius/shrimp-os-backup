if live_call() return live_result;

// Inherit the parent event
event_inherited();

if DEV_MODE && input(vk_f5, PRESS) {
	var t=get_string("enter search term", "");
	generateSearchResults(t);
}