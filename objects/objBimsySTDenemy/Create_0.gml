if live_call() return live_result;

event_inherited();

alive=1;
xpos=x;
ypos=y;
guyspd=objBimsymanager.gamespeed*0.8;
fallspd=-2;
sped=0;
rot=0;

drawScript=function(x,y){
	
	if(floor(current_time)%2==0){
		draw_sprite(sprBimsySTDshadow,0,xpos,ypos);	
	}
	draw_sprite_ext(sprite_index,image_index,xpos,ypos,1,1,0,-1,1);
	
}
