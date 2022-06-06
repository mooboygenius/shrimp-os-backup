if live_call() return live_result;

event_inherited();

var w=GAME_WIDTH,
h=162;
setWindowSize(self, 0, 0, w, h);
urlBar=instance_create_depth(-100, -100, depth-1, fireShrimpAddressBar);
with urlBar {
	text=other.defaultURL;
}
homeButton=instance_create_depth(-100, -100, depth-1, fireShrimpHomeButton);
with homeButton {
	parentWindow=other;
}
with urlBar {
	parentWindow=other;
}

createNewPage=function(object) {
	/// @function createNewPage(object)
	show_debug_message("baller");
	var inst=instance_create_depth(x, y, depth, object);
	with inst {
		depth=other.depth;
		setWindowSize(self, x, y, other.windowWidth, other.windowHeight);
		windowScale=1;
		state=windowStates.idle;
	}
	instance_destroy();
	return inst;
}

scrollY=0;
scrollYLerp=0;
scrollMinimum=0;
scrollMaximum=0;