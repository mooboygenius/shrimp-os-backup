if live_call() return live_result;

event_inherited();

if holding && input(mb_left) {
	var r=1,
	in=getMouseX()-previousMouseX;
	xstart+=in*r;
	var rat=(xstart-leftLimit)/(rightLimit-leftLimit);
	with parentWindow {
		scrollAmount=lerp(maximumScroll, minimumScroll, rat);
	}
} else if !holding {
	with parentWindow {
		other.xstart=lerp(other.leftLimit, other.rightLimit, abs(scrollAmount/minimumScroll));
	}
}

if input(mb_left, RELEASE) && holding {
	show_debug_message("released");
	holding=false;
}

xstart=clamp(xstart, leftLimit, rightLimit);