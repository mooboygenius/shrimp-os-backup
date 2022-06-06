if live_call() return live_result;

event_inherited();

if(input(vk_left,HOLD)){
	sped-=guyspd;
		
}
if(input(vk_right,HOLD)){
	sped+=guyspd;
		
}
if(input(vk_up,HOLD)){
	ysped-=guyspd;
}
if(input(vk_down,HOLD)){
	ysped+=guyspd;
}

ysped=clamp(ysped,-maxspd,maxspd);
sped=clamp(sped,-maxspd,maxspd);

rot=(xpos-64)*-5+(ypos-64)*-5;

xpos+=sped;
ypos+=ysped;

if(ypos<=31){
	ypos=32;
	ysped=abs(ysped);
	playSound(sndBimYelenabounce,1,1,0);	
}
if(ypos>=97){
	ypos=97;
	ysped=-abs(ysped);
	playSound(sndBimYelenabounce,1,1,0);	
}
if(xpos<=31){
	xpos=32;
	sped=abs(sped);
	playSound(sndBimYelenabounce,1,1,0);	
}
if(xpos>=97){
	xpos=97;
	sped=-abs(sped);
	playSound(sndBimYelenabounce,1,1,0);	
}

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsyMadsisciv)){
	var c = instance_place(x,y,objBimsyMadsisciv);
	if(c.alive){
		c.alive=0;
		civsbumped++;
		playSound(sndBimCivhit,1,1,0);
		c.h=c.ypos;
		c.ypos-=1;
		if(c.fr==6){
			playSound(sndBimWow,1,1,0);	
		}
	}
	
}

if(civsbumped==6 && !won){
	won=1;
	playSound(sndBimAnimewow,1,1,0);
	objBimsymanager.wonlastminigame=1;
}

