if live_call() return live_result;

event_inherited();

with parentWindow {
	if !ds_list_find_index(children, other.scrollMarker) {
		ds_list_add(children, other.scrollMarker);
		show_debug_message("added scrollmarker");
	}
}

with scrollMarker {
	leftLimit=other.xstart-other.sprite_xoffset+sprite_xoffset;
	rightLimit=other.xstart+other.sprite_xoffset-sprite_xoffset;
	ystart=other.ystart;
}