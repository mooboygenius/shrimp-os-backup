if live_call() return live_result;

event_inherited();


xpos=1;
ypos=19;

spd=objBimsymanager.gamespeed*0.9;
objBimsymanager.wonlastminigame=1;
fallspd=-2;
slipped=0;
crashed=0;
stopped=0;

drawScript=function(x,y){
	if(!stopped){
		draw_sprite_ext(sprite_index,image_index,xpos+objBimsyminigame.timer/48,ypos,1,1,0,-1,1);
	}else{
		draw_sprite_ext(sprite_index,1,xpos+objBimsyminigame.timer/48,ypos,1,1,0,-1,1);	
	}
	
	
}
