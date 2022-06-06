if live_call() return live_result;

event_inherited();




drawScript=function(x,y){
	draw_sprite_tiled(sprBimsySTDbg,0,-objBimsyminigame.timer*0.1,-objBimsyminigame.timer*0.1);
	draw_sprite(sprBimsySTDrocks,0,0,0);
	draw_sprite(sprBimsySTDheart,0,18,18+sin(objBimsyminigame.timer*0.1));
	
}
