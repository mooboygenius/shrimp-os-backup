if live_call() return live_result;

event_inherited();

canpress=0;
titlescale=0;

xpos=x;
ypos=y;

menupos=0;
menuy=[64,80,96];
cury=64;
menux=[64,64,64];

musiced=0;

drawScript=function(x,y){
	draw_sprite_tiled(sprBimbg,0,current_time*0.01,current_time*0.01);
	draw_sprite_ext(sprBimsyTitle,image_index,3,128,1,1,0,-1,1);
	draw_sprite_ext(sprBimsylogo,0,64,24+cos(current_time*0.003)*2,titlescale,titlescale,sin(current_time*0.005)*3,-1,1);
	
	draw_sprite_ext(sprBimsyedition,0,64,50,titlescale,titlescale,sin(20+current_time*0.01)*2,-1,1);
	
	draw_sprite_ext(sprBimbuttonPlay,0,menux[0],64,1,1,0,-1,1);
	draw_sprite_ext(sprBimbuttonScores,0,menux[1],80,1,1,0,-1,1);
	draw_sprite_ext(sprBimbuttonCredits,0,menux[2],96,1,1,0,-1,1);
	draw_sprite_ext(sprBimcursor,0,57,cury+8,1,sin(current_time*0.01),0,-1,1);
}
