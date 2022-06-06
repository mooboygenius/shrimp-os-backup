if live_call() return live_result;

event_inherited();

if(!won){
	if(input(vk_left,HOLD)){
		sped=lerp(sped,-guyspd,0.4);
	}
	if(input(vk_right,HOLD)){
		sped=lerp(sped,guyspd,0.4);
	}
	if(input(vk_up,HOLD)){
		ysped=lerp(ysped,-guyspd,0.4);
	}
	if(input(vk_down,HOLD)){
		ysped=lerp(ysped,guyspd,0.4);
	}

	if(!input(vk_left,HOLD) && !input(vk_right,HOLD)){
		sped=lerp(sped,0,0.4);
	}
	if(!input(vk_up,HOLD) && !input(vk_down,HOLD)){
		ysped=lerp(ysped,0,0.4);
	}
}else{
	sped=0;
	ysped=0;
}

xpos+=sped;
ypos+=ysped;



x=xpos;
y=ypos;

if(kills>=3 && !won){
	won=1;
	playSound(sndBimSparkle,0,1,0);
	objBimsymanager.wonlastminigame=1;
}

if(won){
	xpos+=guyspd;
	ypos=lerp(ypos,64,0.1);
}else{
	xpos=clamp(xpos,16,96);
	ypos=clamp(ypos,16,96);
}

