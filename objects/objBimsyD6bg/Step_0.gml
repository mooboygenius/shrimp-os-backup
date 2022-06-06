if live_call() return live_result;

event_inherited();

if(!grabbed){
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

tx+=sped;
ty+=ysped;

tx=clamp(tx,32,112);
ty=clamp(ty,16,94);

if(tx>=82 && ty<=37 && !grabbed){
	grabbed=1;
	playSound(sndBimSlimo,1,1,0);
	objBimsymanager.wonlastminigame=1;
}

if(grabbed){
	hx=tx;
	hy=ty;
	tx=lerp(tx,36,0.2);
	ty=lerp(ty,91,0.2);
}

if(tx<=48 && ty>=77 && grabbed && !won){
	won=1;
	
	playSound(sndBimBite,1,1,0);
	sprite_index=sprBimsyHotdog2guyate;
}

if(won){
	offset=lerp(offset,-96,0.1);	
}
