if live_call() return live_result;

event_inherited();

xpos=x;
ypos=y;
guyfr=0;
guyspd=objBimsymanager.gamespeed*1.5;
sped=0;

drawScript=function(x,y){
	draw_sprite(sprBimsyCatchguy,guyfr,xpos,ypos);
}
