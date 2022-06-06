if live_call() return live_result;

event_inherited();

if(!landed){
	bgscale+=objBimsymanager.gamespeed*fallspd;
	fallspd+=0.00011;
	bgscale=clamp(bgscale,0,1);
	
	if(input(vk_left,HOLD)){
		sped=lerp(sped,guyspd,0.1);
	}
	if(input(vk_right,HOLD)){
		sped=lerp(sped,-guyspd,0.1);
	}
	if(input(vk_up,HOLD)){
		ysped=lerp(ysped,guyspd,0.1);
	}
	if(input(vk_down,HOLD)){
		ysped=lerp(ysped,-guyspd,0.1);
	}

	if(!input(vk_left,HOLD) && !input(vk_right,HOLD)){
		sped=lerp(sped,0,0.1);
	}
	if(!input(vk_up,HOLD) && !input(vk_down,HOLD)){
		ysped=lerp(ysped,0,0.1);
	}
	
	bgpos[0]+=sped;
	bgpos[1]+=ysped;
	//bgpos[0]=clamp(bgpos[0],64-80*bgscale,64+80*bgscale);
	//bgpos[1]=clamp(bgpos[1],64-80*bgscale,64+80*bgscale);
}
bimscale=lerp(bimscale,1,0.2);
if(bgscale==1 && !landed){
	landed=1;
	if(point_distance(64,64,bgpos[0]+targetpos[0],bgpos[1]+targetpos[1])<=40){
		playSound(sndBimSqueak,0,1,0);
		objBimsymanager.wonlastminigame=1;
		bimscale=0.5;
	}else{
		playSound(sndBimWow,0,1,0);
		playSound(sndBimCork,0,1,0);
		objBimsymanager.wonlastminigame=0;
	}
}



