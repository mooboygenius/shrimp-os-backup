if live_call() return live_result;

event_inherited();

xpos=x;
ypos=y;
fr=0;
guyspd=objBimsymanager.gamespeed;
downspd=objBimsymanager.gamespeed*0.6;
sped=0;
landed=0;
facing=1;

drawScript=function(x,y){
	draw_sprite_ext(sprBimsyFitinclaw,fr,xpos,ypos,1,1,0,-1,1);
	if(!landed){
		draw_sprite_ext(sprBimsyFitinarrows,image_index,xpos,ypos,1,1,0,-1,1);
	}
}
