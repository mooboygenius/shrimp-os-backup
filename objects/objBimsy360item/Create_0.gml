if live_call() return live_result;

event_inherited();

alive=1;
xpos=x;
ypos=y;
fr=irandom_range(0,2);
if(objBimsymanager.shrimpmode){
	fr=3;	
}
guyspd=objBimsymanager.gamespeed;
fallspd=-2;
sped=0;
rot=0;
collected=0;

drawScript=function(x,y){
	
	if(!collected){
	draw_sprite_ext(sprite_index,fr,xpos,ypos,1,1,sin(objBimsyminigame.timer*0.2)*4,-1,1);
	}
}
