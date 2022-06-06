if live_call() return live_result;

event_inherited();

moving=0;
xpos=x;
ypos=y;
spd=objBimsymanager.gamespeed*0.5;

pointed=0;


drawScript=function(x,y){
	draw_sprite_ext(sprite_index,image_index,xpos,ypos,1,1,0,-1,1);
	
}
