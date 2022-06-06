if live_call() return live_result;

// Inherit the parent event
event_inherited();

if ds_exists(replies, ds_type_list) ds_list_destroy(replies);