if live_call() return live_result;

event_inherited();

ds_map_destroy(users);
ds_list_destroy(userList);
ds_list_destroy(userObjects);