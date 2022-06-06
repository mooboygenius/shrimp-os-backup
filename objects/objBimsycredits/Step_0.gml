if live_call() return live_result;

event_inherited();


if(input(ord("Z"),PRESS) && canpress){
	playSound(sndBimClick,1,random_range(0.9,1.1),0);
	audio_stop_sound(objBimsymanager.bimmusic);
	objBimsymanager.bimmusic=playSound(musBimsytitle,1,1,1);
	createWindowInstance(0,0,depth+1,objBimsymenu,parentWindow);
	instance_destroy(self);
}

if(!canpress){
	canpress=1;	
}



if(input(vk_up,HOLD)){
	scrolly+=3;
}else{
	if(input(vk_down,HOLD)){
		scrolly-=3;
	}else{
		scrolly-=0.5;
	
	}
}

if(scrolly<-array_length(credits)*16){
	scrolly=128;	
}

if(scrolly>129){
	scrolly= -array_length(credits)*16+1;	
}
