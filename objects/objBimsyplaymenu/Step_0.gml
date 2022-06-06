if live_call() return live_result;

event_inherited();

tickerx-=1.5;
draw_set_font(fntSilver);
if(tickerx <= 0-string_width(ticker)){
	tickerx=128;	
}
if(floor(tickerx/4)%2==0){
	tickercol=$83eeff;
}else{
	tickercol=$c0e892;
}

for(var i=0; i<5; i++){
	menupos[i]=lerp(menupos[i],menuposg[i],0.2);	
}
menucol=lerp(menucol,menucolg,0.2);

if(canpress){
	if(input(vk_right,PRESS)){
		updatetext=1;	
		playSound(sndBimPyorowalk,1,1+menucolg*0.2,0);
		menucolg++;
		if(menucolg>=4+1){
			menucolg=0;	
		}
	}
	if(input(vk_left,PRESS)){
		updatetext=1;	
		playSound(sndBimPyorowalk,1,1+menucolg*0.2,0);
		menucolg--;
		if(menucolg<=-1){
			menucolg=4;	
		}
	}
	if(input(vk_up,PRESS)){
		updatetext=1;	
		playSound(sndBimPyorowalk,1,1+menuposg[menucolg]*0.2,0);
		if(menucolg<=colmax){
			menuposg[menucolg]--;
			if(menuposg[menucolg]<=-1){
				menuposg[menucolg]=	menumax[menucolg];
			}
		}
	}
	if(input(vk_down,PRESS)){
		updatetext=1;	
		playSound(sndBimPyorowalk,1,1+menuposg[menucolg]*0.2,0);
		if(menucolg<=colmax){
			menuposg[menucolg]++;
			if(menuposg[menucolg]>=menumax[menucolg]+1){
				menuposg[menucolg]=	0;
			}
		}
	}
	
	if(input(ord("Z"),PRESS)){
		
		if(menucolg=0){
			if(menuposg[0]==1){
				playSound(sndBimClick,1,random_range(0.9,1.1),0);
				createWindowInstance(0,0,depth,objBimsymenu,parentWindow);
				instance_destroy(self);
			}else{
				if(menuposg[1]<=objBimsymanager.stagesdone && objBimsymanager.unlockedchars[menuposg[2]] && objBimsymanager.unlockedmusic[menuposg[3]]){
					playSound(sndBimClick,1,random_range(0.9,1.1),0);
					var e=0;
					if(menuposg[1]==4){
						e=1;
					}
					var s=0;
					if(menuposg[4]==1){
						s=1;	
					}
					
					objBimsymanager.setup=[clamp(menuposg[1],0,3),menuposg[2],menuposg[3],e,s];
					objBimsymanager.currstage=menuposg[1];
					if(menuposg[4]==2){
						objBimsymanager.emma=1;
					}else{
						objBimsymanager.emma=0;
					}
					
					if(menuposg[4]==3){
						objBimsymanager.soul=1;
					}else{
						objBimsymanager.soul=0;
					}
					
					if(menuposg[4]==4){
						objBimsymanager.wamiugi=1;
					}else{
						objBimsymanager.wamiugi=0;
					}
					audio_stop_sound(objBimsymanager.bimmusic);
					switch(menuposg[1]){
						default: break;
						case 0: objBimsymanager.cutscene= "1-1"; break;
						case 1: objBimsymanager.cutscene= "2-1"; break;
						case 2: objBimsymanager.cutscene= "3-1"; break;
						case 3: objBimsymanager.cutscene= "4-1"; break;
						case 4: objBimsymanager.cutscene= "5-1"; break;
					}
					createWindowInstance(0,0,depth,objBimsycutscene,parentWindow);
					instance_destroy(self);
				}else{
					playSound(sndBimIncorrect,1,random_range(0.9,1.1),0);
				}
			}
		}
	}
	
}

if(updatetext){
	objBimsymanager.menuposg=menuposg;
	updatetext=0;
	tickerx=128
	tex= string(menucolg)+"-"+string(menuposg[menucolg]);
	switch(tex){
		default: ticker=tex; break;	
		case "0-0": ticker="Start the game with these settings? Let's go!"; break;	
		case "0-1": ticker="Wanna quit back to the main menu?"; break;	
		case "1-0": ticker="Stage 1- BIMSYMART: 'Hiya, it's me, Bimsy! I'm looking for some frozen food to stock up the ol' freezer at Maison Sakazaki. Wanna help me out?'"; break;	
		case "1-1": 
			if(objBimsymanager.stagesdone>=1){
				ticker="Stage 2- ON THE ROCKS: 'Glub glub... Hi, I'm Sec! Some big, mean rabbit threw me inside a cup of lime juice and keeps stirring me up! I'm getting dizzy...'"; 	
			}else{
				ticker="(Beat Stage 1 to unlock this!)";
			}
		break;
		case "1-2": 
			if(objBimsymanager.stagesdone>=2){
				ticker="Stage 3- DAY OFF: 'Is this thing on? It's me, Marisha! I'm learning how to use a computer! Hehehaha! This thing has games on it, right?'"; 	
			}else{
				ticker="(Beat Stage 2 to unlock this!)";
			}
		break;
		
		case "1-3": 
			if(objBimsymanager.stagesdone>=3){
				ticker="Stage 4- BIMSYGOTCHI: 'Aww, it's so cute! Seems like it wants to play with every single microgame you've seen so far. Good luck!'"; 
			}else{
				ticker="(Beat Stage 3 to unlock this!)";
			}
		break;	
		case "1-4": 
			if(objBimsymanager.stagesdone>=4){
				ticker="Stage 5- BEAMSY JAMBOREE: 'Heya, it's me, Beamsy!!! If there's one thing I hate, it's PAUSES BETWEEN MICROGAMES. Catch my drift? Hyahyahyahahaheha!!!'"; 
			}else{
				ticker="(Get 9 points in Stage 4 to unlock this!)";
			}
		break;	
		case "2-0": ticker="Default voice- Play using the stage character's voice."; break;	
		case "2-1": ticker="Bimsy's voice- 'Don't stop praying! Amen!'"; break;	
		case "2-2": ticker="Sec's voice- 'Look alive! Ubububu...'"; break;	
		case "2-3": ticker="Marisha's voice- 'Just... Just one more round!'"; break;	
		case "2-4": ticker="Beamsy's voice- 'WELCOME TO HELL!'"; break;	
		case "2-5": ticker="Gamio's voice- 'Super... Gamio...'"; break;	
		case "2-6": ticker="Petet's voice- 'Yes The New Original Ant Player 'Petet' Wins Many Micro Games'"; break;	
		case "3-0": ticker="Music- Microgame tracks: This'll let the standard music play during each microgame. Nice!"; break;	
		case "3-1": ticker="Music- Beamsy Jamboree: Makes you feel like you're gently poking the spikes on a cactus (in a good way!)"; break;	
		case "3-2": ticker="Music- Don't stop praying: Finally in dual language. This one goes out to all Chinese Bimsy fans!"; break;	
		case "3-3": ticker="Music- Bimsy97: The sun rises above BimsyMart. I love BimsyMart!"; break;	
		case "4-0": ticker="Standard: The way Bimsymart was meant to be played!"; break;	
		case "4-1": ticker="Shrimpmode: ???"; break;	
		case "4-2": ticker="Emma's glasses: 1 HP. Super speed right from the get go. Are you a cute enough genius?"; break;	
		case "4-3": ticker="Bimsy's soul: The speed increases at a breakneck pace! Try and keep up!"; break;	
		case "4-4": ticker="Wamiugi bedtime: This shallot is simply delightful."; break;	
		
	}
	if(!(menucolg<=colmax)){
		ticker="(Unlock more options by playing Stage 5!)";
	}
	
	if(menucolg==2 && objBimsymanager.unlockedchars[menuposg[2]]==0){
		switch(menuposg[menucolg]){
			case 1: ticker="(Score 20 points on Stage 1 to unlock this lamb!)"; break;	
			case 2: ticker="(Score 25 points on Stage 2 to unlock this tardigrade!)"; break;	
			case 3: ticker="(Score 30 points on Stage 3 to unlock someone MAD!)"; break;	
			case 4: ticker="(Score 38 points on Stage 5 for a ticket straight ta hell!)"; break;	
			case 5: ticker="(Score 40 points on Stage 4.... Mamma Mia...)"; break;	
			case 6: ticker="(Yes Score 70 Points On Stage 5 To Get This New Original Ant Player)"; break;	
		}
	}
	if(menucolg==3 && objBimsymanager.unlockedmusic[menuposg[3]]==0){
		switch(menuposg[menucolg]){
			case 2: ticker="(Score 50 points on Stage 5 to unlock an uplifting tune!)"; break;	
			case 3: ticker="(Score 60 points on Stage 4 to unlock an accursed melody!)"; break;	
		}
	}
}

if(!canpress){
	
	canpress=1;
	
}
