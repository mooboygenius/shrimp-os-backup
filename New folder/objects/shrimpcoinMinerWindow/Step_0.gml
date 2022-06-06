if live_call() return live_result;

// Inherit the parent event
event_inherited();

textScale=lerp(textScale, 1, .2);

if gameFrame%600==0 {
	updateData("shrimpCoins", shrimpCoins);
	saveGame();
	ng_postScore(11842, shrimpCoins);
}

var sx=portWidth,
sy=20;

var r=0;
for (var i=0; i<ds_list_size(shopItems); i++) {
	var list=shopItems[| i],
	ow=list[? "owned"];
	with list[? "object"] {
		medal=list[? "medal"];
		coins=other.shrimpCoins;
		width=100;
		height=28;
		owned=ow;
		var gx=sx-width/2-4;
		if !doShow {
			gx+=width*2;
			xstart=gx;
		}
		xstart=lerp(xstart, gx, .2);
		ystart=sy;
		var yo=height+1;
		sy+=yo;
	}
	
	var m=max(1, 240 div max(1, ow));
	if ow>0 && gameFrame%m==0 {
		part_particles_create(minerSystem, portWidth+32, 68+irandom(24), list[? "particle"], 1);
	}
	
	var amount=list[? "coinsPerSecond"]*ow;
	r+=(amount/60);
}

shrimpCoins+=r;

shrimpCoinsLerp=lerp(shrimpCoinsLerp, shrimpCoins, .2);

for (var i=0; i<array_length(coinUnlocks); i++) {
	if shrimpCoins>=coinUnlocks[i][1] {
		if !coinUnlocks[i][0] {
			coinUnlocks[i][0]=true;
			unlockMedal(coinUnlocks[i][2]);
		}
	}
}