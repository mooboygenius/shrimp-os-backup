if live_call() return live_result;

event_inherited();

timer=240;
addedscore=0;
music=musBimsyMGCowboy;
manager=objBimsymanager;
border=0;

ticks=[0,0,0];

elements=ds_list_create();

drawScript=function(x,y){
	if(objBimsymanager.shrimpmode){
		draw_sprite(sprBimminigamebordershrimp,border,0,0);
	}else{
		draw_sprite(sprBimminigameborder,border,0,0);
	}
	if(timer<90 && timer>60){
		draw_sprite_ext(sprBimtimer,0,109-(timer-60)/10,107,1,1,0,c_white,1);	
	}
	if(timer<60 && timer>30){
		draw_sprite_ext(sprBimtimer,1,109-(timer-30)/10,107,1,1,0,c_white,1);	
	}
	if(timer<30){
		draw_sprite_ext(sprBimtimer,2,109-(timer)/10,107,1,1,0,c_white,1);	
	}
}

