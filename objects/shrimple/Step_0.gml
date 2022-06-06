if live_call() return live_result;

// Inherit the parent event
event_inherited();

with searchBar {
	image_xscale=1;
	image_yscale=1;
	xstart=other.portWidth div 2;
	ystart=80;
}

with searchButton {
	xstart=other.portWidth div 2;
	ystart=104;
}
