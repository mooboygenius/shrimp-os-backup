if live_call() return live_result;

event_inherited();

downloadButton=instance_create_depth(-100, -100, 0, textButton);
with downloadButton {
	sprite_index=sprShteamButton;
	selectColor=WHITE_COLOR;
	text="DOWNLOAD NOW";
	clickFunction=function() {
		createDownloadWindow(shteam, "Shteam");
	}
}

ds_list_add(children, downloadButton);