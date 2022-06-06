if live_call() return live_result;

event_inherited();

xpos=x;
ypos=y;
guyspd=objBimsymanager.gamespeed*1.5;
sped=0;
rot=0;
alive=1;

if(objBimsymanager.shrimpmode){
	sprite_index=sprBimsyDeadshrimp;	
}

drawScript=function(x,y){
	if(alive){
		draw_sprite_ext(sprite_index,image_index,xpos,ypos,1,1,0,-1,1);
	}
}
