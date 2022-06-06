if live_call() return live_result;

event_inherited();

verticalSpeed=1;

defaultGrabScript=function() {
	instance_destroy();
	var inst=instance_create_depth(x, y, depth-1, sdTextPopup);
	with inst {
		life=60;
		text=other.grabText;
	}
}

grabScript=function() {
	defaultGrabScript();
}