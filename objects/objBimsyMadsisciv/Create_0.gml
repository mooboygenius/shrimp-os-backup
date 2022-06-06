if live_call() return live_result;

event_inherited();

fr=irandom_range(0,9);
if(objBimsymanager.shrimpmode){
	fr=10;	
}
alive=1;
xpos=x;
ypos=y;
movetimer=30;
move=random_range(0.8,1.2);
fallspd=random_range(-5,-2);
h=0;
sped=0;
rot=0;
facing=1;
if(irandom_range(0,1)){
	facing=-1;	
}

drawScript=function(x,y){
	
	if(alive){
		draw_sprite_ext(sprite_index,fr,xpos,ypos,facing,1,rot,-1,1);
	}else{
		if(floor(current_time)%2==0){
			draw_sprite_ext(sprite_index,fr,xpos,ypos,facing,1,rot,-1,1);	
		}
	}
	
	
}
