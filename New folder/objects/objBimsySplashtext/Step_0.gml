if live_call() return live_result;

event_inherited();

i+=1;
x=xpos+sin(i*0.23);
y=ypos+sin(i*0.15);

life-=manager.gamespeed;
if(life>0){
	scale=lerp(scale,1,0.5);	
}else{
	scale=lerp(scale,0,0.2);
	if(scale<0.05){
		instance_destroy(self);
	}
}

xstart=x;
ystart=y;
