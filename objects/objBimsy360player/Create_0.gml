if live_call() return live_result;

event_inherited();

xpos=x;
ypos=y;
jumping=0;
yspd=-3;
rot=0;

items=0;
won=0;

drawScript=function(x,y){
	draw_sprite_ext(sprite_index,image_index,xpos,ypos,1,1,rot,-1,1);
}
