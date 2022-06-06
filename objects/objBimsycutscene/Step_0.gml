if live_call() return live_result;

event_inherited();


if(input(ord("Z"),PRESS) && canpress){
	pointer++;
	playSound(sndBimClick,1,random_range(0.9,1.1),0);
	
}
if(input(ord("X"),PRESS) && canpress){
	pointer=array_length(cutscene);
	playSound(sndBimClick,1,random_range(0.9,1.1),0);
	
}

if(pointer>=array_length(cutscene)){
	if(!dest){
		audio_stop_sound(objBimsymanager.bimmusic);
		bimsysetup(objBimsymanager.setup[0],objBimsymanager.setup[1],objBimsymanager.setup[2],objBimsymanager.setup[3],objBimsymanager.setup[4]);
		instance_destroy(self);	
	}else{
		playSound(sndBimCuica,1,1,0);
		audio_stop_sound(objBimsymanager.bimmusic);
		createWindowInstance(0,0,depth+1,objBimsygameover,parentWindow);
		instance_destroy(self);
	}
}

if(!canpress){
	canpress=1;	
}


