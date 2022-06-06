if live_call() return live_result;

event_inherited();

with parentWindow {
	if ds_list_find_index(children, other.mySign)<0 {
		ds_list_insert(children, 0, other.mySign);
	}
}