if live_call() return live_result;

event_inherited();

blueColor=$996F68;
lightBlueColor=$C2A7A3;

downloadButton=instance_create_depth(-100, -100, depth-20, textOnlyButton);

with downloadButton {
	owner=other;
	font=fntFancy;
	text="Download";
	selectColor=other.lightBlueColor;
	unselectColor=other.blueColor;
	clickFunction=function() {
		with owner {
			createNewPage(shrimposerDownloadPage);
		}
	}
}

helpButton=instance_create_depth(-100, -100, depth-20, textOnlyButton);

with helpButton {
	owner=other;
	text="Help";
	font=fntFancy;
	selectColor=other.lightBlueColor;
	unselectColor=other.blueColor;
	clickFunction=function() {
		with owner {
			createNewPage(shrimposerHelpPage);
		}
	}
}

ds_list_add(children, helpButton, downloadButton);