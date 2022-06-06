if live_call() return live_result;

event_inherited();

switch substate {
	case 0:
		if getActiveWindow()==id {
			text=getStringInput(text);
			var in=(mouse_wheel_up()-mouse_wheel_down())*16;
			scrollY+=in;
			scrollY=clamp(scrollY, -256, 0);
			scrollYLerp=lerp(scrollY, scrollYLerp, .3);
		}
	break;
}

with myFile {
	saveInfo=other.text;
}