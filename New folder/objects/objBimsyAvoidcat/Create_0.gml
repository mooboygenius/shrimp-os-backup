if live_call() return live_result;

event_inherited();

xpos=53;
ypos=81;
guyfr=0;
guyspd=objBimsymanager.gamespeed*1.2;
sped=0;
dead=0;

flip=1;
facing=1;

drawScript=function(x,y){
	draw_sprite_ext(sprite_index,image_index,xpos,ypos,flip,1,0,-1,1);
}
