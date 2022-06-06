if live_call() return live_result;

xstart=x;
ystart=y;

timer++;
if timer>15 {
	timer=0;
	fade-=.1;
	if fade<=0 instance_destroy();
}