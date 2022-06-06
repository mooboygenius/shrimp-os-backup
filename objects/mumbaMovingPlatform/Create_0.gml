if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	defaultDrawScript(x, y);
}

previousX=x;
previousY=y;
left=x;
right=x;
top=y;
bottom=y;
moveTime=4;
moveOffset=0;