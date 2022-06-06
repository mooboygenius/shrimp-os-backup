if live_call() return live_result;

event_inherited();

moving=0;
xpos=x;
ypos=y;
guyfr=0;
guyspd=objBimsymanager.gamespeed*0.3;
maxspd=3*objBimsymanager.gamespeed;
sped=0;
ysped=0;
dead=0;
rot=0;

won=0;
civsbumped=0;


drawScript=function(x,y){
	draw_sprite_ext(sprite_index,won,xpos,ypos,1,1,rot,-1,1);
}
