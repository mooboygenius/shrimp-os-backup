if live_call() return live_result;

event_inherited();

useMumbaPhysics();

xstart=x;
ystart=y;

// IGNORE THIS DOWN HERE
if turnTowardsMovementDirection {
	if horizontalSpeed!=0 {
		xScale=lerp(xScale, sign(horizontalSpeed), .25);
	} else {
		xScale=lerp(xScale, sign(xScale), .25);
	}
}