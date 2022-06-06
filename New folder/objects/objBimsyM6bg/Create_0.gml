if live_call() return live_result;

event_inherited();




drawScript=function(x,y){
	draw_sprite_tiled(sprBimsy360bg,0,objBimsyminigame.timer,0);
	draw_sprite_tiled(sprBimsy360bg,0,objBimsyminigame.timer*0.5,+abs(sin(objBimsyminigame.timer*0.1))*3);
	draw_sprite_tiled(sprBimsy360floor,0,objBimsyminigame.timer,+0);
	
}
