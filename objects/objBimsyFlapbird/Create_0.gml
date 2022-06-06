if live_call() return live_result;

event_inherited();

dead=0;
xpos=x;
ypos=y;
yspd=-1;

rot=0;
fr=0;

if(objBimsymanager.shrimpmode){
	fr=1;	
}

drawScript=function(x,y){
	draw_sprite_ext(sprite_index,fr,xpos,ypos,1,1,rot,-1,1);
}
