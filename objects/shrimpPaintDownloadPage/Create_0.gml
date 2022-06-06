if live_call() return live_result;

event_inherited();

downloadProgramButton=instance_create_depth(-100, -100, depth-20, button);
with downloadProgramButton {
	clickFunction=function() {
		createDownloadWindow(paintDocument, "Shrimp Paint");
	}
	sprite_index=sprShrimpPaintDownloadButton;
}
ds_list_add(children, downloadProgramButton);