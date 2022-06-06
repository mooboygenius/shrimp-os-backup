if live_call() return live_result;

event_inherited();

xpos=x;
ypos=y;
guyfr=0;
guyspd=objBimsymanager.gamespeed*1.2;
sped=0;
ysped=0;
dead=0;

won=0;

flip=1;
facing=1;

drawScript=function(x,y){
	
	draw_sprite_ext(sprite_index,image_index,xpos,ypos,1,1,sped*5,-1,1);
}
