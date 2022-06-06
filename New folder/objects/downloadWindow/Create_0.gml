if live_call() return live_result;

event_inherited();

setWindowSize(self, 0, 0, 184, 100)
centerWindow(self);

yesButton=instance_create_depth(0, 0, -1000, textButton);
noButton=instance_create_depth(0, 0, -1000, textButton);

substate=0;

var sc=2;
with noButton {
	sprite_index=sprButton;
	image_xscale=sc;
	lockSize=true;
	text="No";
	clickFunction=function() {
		with parentWindow {
			state=windowStates.close;
		}
	}
}
with yesButton {
	sprite_index=sprButton;
	image_xscale=sc;
	lockSize=true;
	text="Yes";
	clickFunction=function() {
		with parentWindow {
			substate=1;
			name="Downloading...";
		}
	}
}
ds_list_add(children, noButton, yesButton);

fileName="placeholder";

timer=0;