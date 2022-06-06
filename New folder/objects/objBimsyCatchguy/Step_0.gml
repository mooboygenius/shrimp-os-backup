if live_call() return live_result;

event_inherited();

if(input(vk_left,HOLD)){
	sped=lerp(sped,-guyspd,0.3);
}
if(input(vk_right,HOLD)){
	sped=lerp(sped,guyspd,0.3);
}

if(!input(vk_left,HOLD) && !input(vk_right,HOLD)){
	sped=lerp(sped,0,0.3);
}

xpos+=sped;

xpos=clamp(xpos,-7,67);
ypos=71+sin(current_time*objBimsymanager.gamespeed*0.01)*2;

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsyCatchburg) && !objBimsyCatchburg.caught){
	playSound(sndBimCork,1,random_range(0.9,1.1),0);
	objBimsyCatchburg.caught=1;
	objBimsyCatchburg.caughtoffset=objBimsyCatchburg.xpos-xpos;
	objBimsymanager.wonlastminigame=1;
	guyfr=1;
}
