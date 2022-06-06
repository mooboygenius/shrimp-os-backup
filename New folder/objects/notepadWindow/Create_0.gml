if live_call() return live_result;

event_inherited();

var w=160, h=3/4*w;
setWindowSize(self, x, y, w, h);
text="";
substate=0;

loadFileData=function(str) {
	text=str;
}

scrollY=0;
scrollYLerp=0;