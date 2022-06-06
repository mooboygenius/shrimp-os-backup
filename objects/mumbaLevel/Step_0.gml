if live_call() return live_result;

event_inherited();


addChildrenToParentWindow(children);

var w=tileSurfaceWidth, h=tileSurfaceHeight;
with parentWindow {
	cameraLeftLimit=-16;
	cameraTopLimit=-16;
	cameraRightLimit=-w+17;
	cameraBottomLimit=-h+17;
}