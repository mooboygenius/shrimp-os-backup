if live_call() return live_result;

// Inherit the parent event
event_inherited();

downloadButton=instance_create_depth(-1000, -1000, depth-1, textButton);
with downloadButton {
	visible=false;
	sprite_index=sprShrimpcordDownloadButton;
	font=fntMumbaShop;
	selectColor=BLACK_COLOR;
	unselectColor=WHITE_COLOR;
	text="Download Now";
	lockSize=true;
	image_xscale=5;
	image_yscale=1;
	clickFunction=function() {
		createDownloadWindow(shrimpcordIcon, "Shrimpcord");
	}
}
ds_list_add(children, downloadButton);

gotoQAButton=instance_create_depth(-1000, -1000, depth-1, textOnlyButton);
with gotoQAButton {
	unselectColor=$5E3F3A;
	selectColor=WHITE_COLOR;
	visible=false;
	text="Please click here to see our response\nto the recent account hijacking issue.";
	font=fntSystem;
	clickFunction=function() {
		with parentWindow {
			createNewPage(shrimpcordQAPage)
		}
	}
}
ds_list_add(children, gotoQAButton);