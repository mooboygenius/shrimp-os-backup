if live_call() return live_result;

event_inherited();

if ds_exists(children, ds_type_list) ds_list_destroy(children);
if ds_exists(posts, ds_type_list) ds_list_destroy(posts);