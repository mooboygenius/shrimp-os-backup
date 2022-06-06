if live_call() return live_result;

event_inherited();

menux=lerp(menux,0,0.2);
witchx=lerp(witchx,0,0.2)+sin(objBimsyminigame.timer*0.05);

if(!complete){
	
	scales=[1,1,1];
	textcol[0]=$e8fff5;
	textcol[1]=$e8fff5;
	textcol[2]=$e8fff5;
	
	scales[menupos]=sin(objBimsyminigame.timer*0.1);
	textcol[menupos]=colours[menupos];
	
	if(input(vk_up,PRESS)){
		menupos--;
		if(menupos==-1){
			menupos=1;	
		}
		updatetext=1;
		playSound(sndBimPyorowalk,1,1,0);
	}	
	if(input(vk_down,PRESS)){
		menupos++;
		if(menupos==2){
			menupos=0;	
		}
		updatetext=1;
		playSound(sndBimPyorowalk,1,1,0);
	}	
	if(input(ord("Z"),PRESS)){
		if(menupos==item){
			switch(irandom_range(0,2)){
				case 0: dial="great choice!"; break;
				case 1: dial="of course!"; break;
				case 2: dial="there you go!"; break;
			}
			money=0;
			complete=1;
			colours[item]=$c2a7a3;
			pricecol[item]=$c2a7a3;
			prices[item]="sold!";
			playSound(sndBimBite,1,1,0);
			objBimsymanager.wonlastminigame=1;
		}else{
			playSound(sndBimIncorrect,0,1,0);
			objBimsymanager.wonlastminigame=0;
			complete=1;
			switch(irandom_range(0,4)){
				case 0: dial="huh?"; break;
				case 1: dial="umm..."; break;
				case 2: dial="you can't."; break;
				case 3: dial="no way."; break;
				case 4: dial="what the hell."; break;
			}
		}
	}

	if(updatetext){
		updatetext=0;
		dial=itemdescs[menupos];
	}
}else{
	scales=[1,1,1];	
}

