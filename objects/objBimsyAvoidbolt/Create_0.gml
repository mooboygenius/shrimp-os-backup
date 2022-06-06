if live_call() return live_result;

event_inherited();

xpos=irandom_range(16,98);
ypos=y;
guyspd=objBimsymanager.gamespeed*0.8;
sped=0;

drawScript=function(x,y){
	draw_sprite(sprite_index,image_index,xpos,ypos);
}
