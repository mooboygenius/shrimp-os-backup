if live_call() return live_result;

event_inherited();

titlescale=0;

xpos=x;
ypos=y;

drawScript=function(x,y){
	draw_sprite_ext(sprBimsyfire,image_index,0,0,1,1,0,-1,1);
	draw_sprite_ext(sprBimsyerror,image_index,0,sin(current_time*0.001),1,1,0,-1,1);
	
}

