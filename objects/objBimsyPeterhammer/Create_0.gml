if live_call() return live_result;

event_inherited();

xpos=x;
ypos=y;

winy=-50

slammed=0;


drawScript=function(x,y){
	draw_sprite_ext(sprite_index,slammed,xpos,ypos,1,1,0,-1,1);
	
	if(objBimsymanager.wonlastminigame){
		draw_sprite_ext(sprBimsyPeterwin,0,16,winy,1,1,0,-1,1);
	}
	
}
