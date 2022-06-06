if live_call() return live_result;

event_inherited();

if(!dead && !won){
	if(input(vk_left,HOLD)){
		sped=lerp(sped,-guyspd,0.7);
	}
	if(input(vk_right,HOLD)){
		sped=lerp(sped,guyspd,0.7);
	}
	if(input(vk_up,HOLD)){
		ysped=lerp(ysped,-guyspd,0.7);
	}
	if(input(vk_down,HOLD)){
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

xpos+=sped;
ypos+=ysped;

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsyMazewalls) && !dead && !won){
	dead=1;
	playSound(sndBimBanshee,1,1,0);
	objBimsymanager.wonlastminigame=0;
}

if(!won && ypos<=44){
	won=1;
	playSound(sndBimAnimewow,1,1,0);
	objBimsymanager.wonlastminigame=1;
}
