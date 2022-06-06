if live_call() return live_result;

event_inherited();

if(!dead){
	if(input(vk_left,HOLD)){
		sped=lerp(sped,-guyspd,0.2);
	}
	if(input(vk_right,HOLD)){
		sped=lerp(sped,guyspd,0.2);
	}
	if(input(vk_up,HOLD)){
		ysped=lerp(ysped,-guyspd,0.2);
	}
	if(input(vk_down,HOLD)){
		ysped=lerp(ysped,guyspd,0.2);
	}

	if(!input(vk_left,HOLD) && !input(vk_right,HOLD)){
		sped=lerp(sped,0,0.2);
	}
	if(!input(vk_up,HOLD) && !input(vk_down,HOLD)){
		ysped=lerp(ysped,0,0.2);
	}
}else{
	sped=0;
	ysped=0;
}

xpos+=sped;
ypos+=ysped;

xpos=clamp(xpos,16,96);
ypos=clamp(ypos,16,96);

x=xpos;
y=ypos;

if(place_meeting(x,y,objBimsyGamiocone) && !dead){
	dead=1;
	sprite_index=sprBimsyGamionuke;
	playSound(sndBimExplosion,1,1,0);
	playSound(objBimsyD8bg.lose[irandom_range(0,3)],1,1,0);
	objBimsymanager.wonlastminigame=0;
}


