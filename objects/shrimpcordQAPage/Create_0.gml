if live_call() return live_result;

// Inherit the parent event
event_inherited();

gotoDownloadButton=instance_create_depth(-1000, -1000, depth-1, textOnlyButton);
with gotoDownloadButton {
	unselectColor=$5E3F3A;
	selectColor=WHITE_COLOR;
	visible=false;
	text="Click here to return to the download page.";
	font=fntSystem;
	clickFunction=function() {
		with parentWindow {
			createNewPage(shrimpcordDownloadPage)
		}
	}
}
ds_list_add(children, gotoDownloadButton);