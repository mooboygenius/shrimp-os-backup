if live_call() return live_result;

event_inherited();

setWindowSize(self, 0, 0, 190, 90);
centerWindow(self);

var s=3;
yesButton=instance_create_depth(-100, -100, depth-10, textButton);
noButton=instance_create_depth(-100, -100, depth-10, textButton);
with yesButton {
	lockSize=true;
	image_xscale=s;
	text="Yes";
	clickFunction=function() {
		file_delete(SAVE_FILE);
		ds_map_destroy(saveDataMap);
		game_restart();
		room_goto(rmBootup);
		audio_stop_all();
	}
}

with noButton {
	lockSize=true;
	image_xscale=s;
	text="nuh uh";
	clickFunction=function() {
		if parentWindow parentWindow.state=windowStates.close;
	}
}

ds_list_add(children, yesButton, noButton);