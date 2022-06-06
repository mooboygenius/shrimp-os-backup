if live_call() return live_result;

event_inherited();


if(timer<=120){
	bgx-=manager.gamespeed;	
	if(!manager.wonlastminigame){
		foodscale=lerp(foodscale,0,0.1);
	}else{
		itemy+=itemspd;
		itemspd+=0.2;
		foodscale-=0.015;
	}
		
	swirlscale=lerp(swirlscale,0,0.2);	
}else{
	foodscale=lerp(foodscale,1,0.1);	
	swirlscale=lerp(swirlscale,1,0.2);	
}
