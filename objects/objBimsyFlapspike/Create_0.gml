if live_call() return live_result;

event_inherited();

xpos=x;
ypos=y;
guyspd=objBimsymanager.gamespeed*0.8;
sped=0;
rot=0;

drawScript=function(x,y){
	draw_sprite_ext(sprite_index,0,xpos,ypos,1,1,rot,-1,1);
}
