if live_call() return live_result;

// Inherit the parent event
event_inherited();

downloadButton=instance_create_depth(-100, -100, depth-10, button);
with downloadButton {
	sprite_index=sprBimsyPageDownload;
	clickFunction=function() {
		createDownloadWindow(objBimsyicon, "BMSE");
	}
}
ds_list_add(children, downloadButton);