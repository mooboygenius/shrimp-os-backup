if live_call() return live_result;

event_inherited();

if(input(ord("Z"),PRESS) && !gameover){
	fr++;
	distance+=4;
	playSound(sndBimPyorowalk,1,1,0);
}

if(input(ord("Z"),RELEASE) && !gameover){
	fr++;
	distance+=4;
	playSound(sndBimPyorowalk,1,1,0);
}

distance=clamp(distance,0,60);

distance-=monspeed;

girlscale=lerp(girlscale,1-distance*0.01,0.2);

if(distance<=0 && !gameover){
	playSound(sndBimGore,1,1,0);
	gameover=1;
	objBimsymanager.wonlastminigame=0;
}
