if live_call() return live_result;

event_inherited();

downloadButton=instance_create_depth(-100, -100, depth-1, textButton);
with downloadButton {
	sprite_index=sprShrimpifyDownloadButton;
	unselectColor=BLACK_COLOR;
	selectColor=BLACK_COLOR;
	font=fntMumbaShop;
	text="Download"
	clickFunction=function() {
		createDownloadWindow(shrimpifyLogo, "Shrimpify");
	}
}
ds_list_add(children, downloadButton);