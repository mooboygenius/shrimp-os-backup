if live_call() return live_result;

event_inherited();

xpos=irandom_range(7,96);
ypos=0;
guyfr=irandom_range(0,2);
guyspd=0;
sped=0;
if(objBimsymanager.shrimpmode){
	guyfr=3;	
}

caught=0;
splatted=0;
caughtoffset=0;

drawScript=function(x,y){
	draw_sprite(sprBimsyCatchfood,guyfr,xpos,ypos);
}
