if live_call() return live_result;

event_inherited();

i+=1;
j+=1;

swayx=sin(i);
swayy=cos(j);
rot=irandom_range(-4,4);

forkx=lerp(forkx,0,0.4);
forky=lerp(forky,0,0.4);

timer--;
if(timer<=0){
	playSound(sndBimCuica,1,1,0);
	createWindowInstance(0,0,depth+1,objBimsygameover,parentWindow);
	instance_destroy(self);
}
