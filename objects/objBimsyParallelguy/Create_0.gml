if live_call() return live_result;

event_inherited();

moving=0;
xpos=x;
ypos=y;
guyfr=0;
guyspd=objBimsymanager.gamespeed*1.2;
sped=0;
ysped=0;
dead=0;

won=0;

flip=1;
facing=1;

drawScript=function(x,y){
	if(moving){
		draw_sprite_ext(sprite_index,image_index,xpos,ypos,flip,1,0,-1,1);
	}else{
		draw_sprite_ext(sprite_index,0,xpos,ypos,flip,1,0,-1,1);
	}
	if(dead){
		draw_sprite_tiled(sprBimsyParallelsmoke,0,objBimsyminigame.timer*0.5,objBimsyminigame.timer*0.5);
		draw_sprite(sprBimsyParallelheart,0,xpos+irandom(1),ypos-10+irandom(1));
	}
}
