if live_call() return live_result;

// Inherit the parent event
event_inherited();

highlightColor=$83EEFF;

downloadButton=instance_create_depth(-100, -100, depth-20, textOnlyButton);

with downloadButton {
	owner=other;
	text="DOWNLOAD";
	selectColor=other.highlightColor;
	clickFunction=function() {
		with owner {
			createNewPage(shrimpPaintDownloadPage);
		}
	}
}

helpButton=instance_create_depth(-100, -100, depth-20, textOnlyButton);

with helpButton {
	owner=other;
	text="HELP";
	selectColor=other.highlightColor;
	clickFunction=function() {
		with owner {
			createNewPage(shrimpPaintHelpPage);
		}
	}
}

ds_list_add(children, downloadButton, helpButton);