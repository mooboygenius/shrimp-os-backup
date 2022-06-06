if live_call() return live_result;

event_inherited();

if(!pointed){
	direction=point_direction(xpos,ypos,objBimsyParallelguy.x,objBimsyParallelguy.y)+irandom_range(-15,15);
	pointed=1;
}

xpos+=lengthdir_x(spd,direction);
ypos+=lengthdir_y(spd,direction);

x=xpos;
y=ypos;


if(place_meeting(x,y,objBimsyParallelguy) && !objBimsyParallelguy.dead){
	objBimsyParallelguy.dead=1;
	playSound(sndBimBreak,1,1,0);
	objBimsymanager.wonlastminigame=0;
}
