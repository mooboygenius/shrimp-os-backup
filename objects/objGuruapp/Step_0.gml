if live_call() return live_result;

event_inherited();

scrollx+=irandom_range(-1,1);
scrolly+=irandom_range(-1,1);

holding=input(vk_space,HOLD);

if(holding){
	mandalascale=lerp(mandalascale,0.2,0.2);	
}else{
	mandalascale=lerp(mandalascale,1,0.2);	
}

if(input(vk_space,PRESS)){
	playSound(mus,1,1,1);	
}

if(input(vk_space,RELEASE)){
	audio_stop_sound(mus);	
}

