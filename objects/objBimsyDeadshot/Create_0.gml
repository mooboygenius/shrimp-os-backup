if live_call() return live_result;

event_inherited();

xpos=x;
ypos=y;
fr=4;

drawScript=function(x,y){
	
	draw_sprite_ext(sprite_index,fr,xpos,ypos,1,1,0,-1,1);
}
