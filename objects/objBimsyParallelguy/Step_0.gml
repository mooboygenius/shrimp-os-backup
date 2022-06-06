if live_call() return live_result;

event_inherited();

if(!dead && !won){
	moving=0;
	if(input(vk_left,HOLD)){
		moving=1;
		sped=lerp(sped,-guyspd,0.7);
		facing=-1;
	}
	if(input(vk_right,HOLD)){
		moving=1;
		sped=lerp(sped,guyspd,0.7);
		facing=1;
	}
	if(input(vk_up,HOLD)){
		moving=1;
		ysped=lerp(ysped,-guyspd,0.7);
	}
	if(input(vk_down,HOLD)){
		moving=1;
		ysped=lerp(ysped,guyspd,0.7);
	}

	if(!input(vk_left,HOLD) && !input(vk_right,HOLD)){
		sped=lerp(sped,0,0.7);
	}
	if(!input(vk_up,HOLD) && !input(vk_down,HOLD)){
		ysped=lerp(ysped,0,0.7);
	}
}else{
	sped=0;
	ysped=0;
}

flip=lerp(flip,facing,0.3);

xpos+=sped;
ypos+=ysped;

ypos=clamp(ypos,34,111);
xpos=clamp(xpos,22,105);

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsyParallelbullet) && !dead){
	dead=1;
	playSound(sndBimBreak,1,1,0);
	objBimsymanager.wonlastminigame=0;
}
