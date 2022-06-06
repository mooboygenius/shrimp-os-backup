if live_call() return live_result;

event_inherited();

timer=0;
goalTime=irandom_range(240, 300);
pauseAtFrame=-1;
pauseLength=0;
if chance(1) {
	pauseAtFrame=goalTime-irandom_range(60, 90);
	pauseLength=irandom_range(90, 180);
}
finishLoadTime=irandom_range(30, 90);

setWindowSize(self, 0, 0, 100, 120);
centerWindow(self);
shrimpAngle=0;
shrimpShake=0;
shrimpAcceleration=.2;
shrimpText="LOADING";
shrimpFrame=0;

if instance_number(shrimpcord)>0 || instance_number(shrimpcordLoader)>1 instance_destroy();