if live_call() return live_result;

event_inherited();

downloadProgramButton=instance_create_depth(-100, -100, depth-20, button);
with downloadProgramButton {
	sprite_index=sprShrimposerDownload;
	clickFunction=function() {
		createDownloadWindow(shrimposerIcon, "Shrimposer");
	}
}
ds_list_add(children, downloadProgramButton);