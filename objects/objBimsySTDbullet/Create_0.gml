if live_call() return live_result;

event_inherited();

xpos=x;
ypos=y;
guyspd=objBimsymanager.gamespeed*2;
sped=0;
rot=0;
fired=0;

drawScript=function(x,y){
	if(fired){
		draw_sprite_ext(sprite_index,image_index,xpos,ypos,1,1,0,-1,1);
	}
}
