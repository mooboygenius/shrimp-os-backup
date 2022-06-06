if live_call() return live_result;

event_inherited();

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
	draw_sprite_ext(sprite_index,image_index,xpos,ypos,flip,1,0,-1,1);
	if(dead || won){
		draw_sprite_ext(sprBimsyMazejumpscare,won,irandom_range(-1,1),irandom_range(-1,1),1,1,0,-1,1);
		if(won && objBimsymanager.shrimpmode){
			draw_sprite_ext(sprBimsyMazejumpscare,2,irandom_range(-1,1),irandom_range(-1,1),1,1,0,-1,1);
		}
	}
}
