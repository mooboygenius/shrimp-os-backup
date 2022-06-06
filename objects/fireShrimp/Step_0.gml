if live_call() return live_result;

event_inherited();

var hx=x+8,
hy=y+13;
with homeButton {
	x=hx;
	y=hy;
}

var urlX=x+15,
urlY=y+10;

with urlBar {
	var sw=sprite_get_width(sprite_index);
	image_xscale=(other.portWidth-13)/sw*other.windowScale;
	image_yscale=other.windowScale;
	depth=other.depth-1;
	x=urlX
	y=urlY;
}

var in=(mouse_wheel_up()-mouse_wheel_down())*16;
if getActiveWindow()!=id in=0;
scrollY=clamp(scrollY+in, scrollMinimum, scrollMaximum);
scrollYLerp=lerp(scrollYLerp, scrollY, .5);