if live_call() return live_result;

event_inherited();

objBimsymanager.wonlastminigame=1;

distance=clamp(40+30*(objBimsymanager.gamespeed-1),0,60);

fr=0;
monspeed=objBimsymanager.gamespeed*0.5;

girlscale=1-distance*0.01;

gameover=0;

drawScript=function(x,y){
	draw_sprite(sprBimsyrunbg,image_index,16,16);
	draw_sprite_ext(sprBimsyrungirl,fr,64,64,girlscale,girlscale,0,-1,1);
	draw_sprite(sprBimsyrunteeth,0,16,16-abs(sin(current_time*0.01)*10));
	draw_sprite(sprBimsyrunteeth,1,16,64+16+abs(sin(current_time*0.01)*10));
	if(gameover){
		draw_sprite(sprBimsyrunstatic,image_index,16,16);
		draw_sprite(sprBimsyrundead,0,16+irandom_range(-1,1),16+irandom_range(-1,1));
	}
}
