if live_call() return live_result;

event_inherited();

canpress=0;

xpos=x;
ypos=y;

tity=-30;

qtimer=30;

quote="";
switch(irandom_range(0,9)){
	default: quote="Goodnight, Bimsy."; break;
	case 0: quote="You did alright."; break;
	case 1: quote="Try not to squander your lives."; break;
	case 2: quote="Keep it up, just keep it up!"; break;
	case 3: quote="Life doesn't last forever."; break;
	case 4: quote="Don't stop praying."; break;
	case 5: quote="Amen."; break;
	case 6: quote="And that's a wrap."; break;
	case 7: quote="As shrimple as that."; break;
	case 8: quote="Hallelujah."; break;
	case 9: quote="Bimsymart is now closed."; break;
}


if(objBimsymanager.highscores[objBimsymanager.currstage]<objBimsymanager.bimscore){
	if(objBimsymanager.highscores[objBimsymanager.currstage]!=0){
		quote="It's a new high score!";
	}
	objBimsymanager.highscores[objBimsymanager.currstage]=objBimsymanager.bimscore;
}

if(objBimsymanager.currstage==objBimsymanager.stagesdone){
	if(objBimsymanager.currstage==4){
		objBimsymanager.colsunlocked=4;
	}else{
		if(objBimsymanager.currstage<=3 && objBimsymanager.bimscore>=9){
			objBimsymanager.stagesdone++;
		}
		
	}
	
}

switch(objBimsymanager.currstage){
	default: break;
	case 0: 
		if(objBimsymanager.bimscore>=9){
			unlockMedal("Frozen Shrimp");
		}
		if(objBimsymanager.bimscore>=20){
			objBimsymanager.unlockedchars[1]=1;
			updateData("bimsychar1",1);
			unlockMedal("Bimsy's luck");
		}
	break;
	case 1: 
		if(objBimsymanager.bimscore>=9){
			unlockMedal("Lime juice");
		}
		if(objBimsymanager.bimscore>=25){
			objBimsymanager.unlockedchars[2]=1;
			updateData("bimsychar2",1);
			unlockMedal("Sec's appeal");
		}
	break;
	case 2: 
		if(objBimsymanager.bimscore>=9){
			unlockMedal("Phone charm");
		}
	
		if(objBimsymanager.bimscore>=30){
			objBimsymanager.unlockedchars[3]=1;
			updateData("bimsychar3",1);
			unlockMedal("Marisha's drive");
		}
	break;
	case 3: 
		ng_postScore(11845,objBimsymanager.bimscore);
		if(objBimsymanager.bimscore>=9){
			unlockMedal("Digital Poop");
		}
		if(objBimsymanager.bimscore>=40){
			objBimsymanager.unlockedchars[5]=1;
			updateData("bimsychar5",1);
			unlockMedal("Gamio's determination");
		}
		if(objBimsymanager.bimscore>=60){
			objBimsymanager.unlockedmusic[3]=1;
			updateData("bimsymusic3",1);
			unlockMedal("Chin's courage");
		}
	break;
	case 4: 
		ng_postScore(11846,objBimsymanager.bimscore);
		unlockMedal("Fried Shrimp");
		if(objBimsymanager.bimscore>=38){
			objBimsymanager.unlockedchars[4]=1;
			updateData("bimsychar4",1);
			unlockMedal("Beamsy's faith");
		}
		if(objBimsymanager.bimscore>=50){
			objBimsymanager.unlockedmusic[2]=1;
			updateData("bimsymusic2",1);
			unlockMedal("Bimsy's spirit");
		}
		if(objBimsymanager.bimscore>=70){
			objBimsymanager.unlockedchars[6]=1;
			updateData("bimsychar6",1);
			unlockMedal("Petet's heart");
		}
	break;
		
	
}

//save data
updateData("bimsyhs"+string(objBimsymanager.currstage), objBimsymanager.highscores[objBimsymanager.currstage]);

updateData("bimsystages",objBimsymanager.stagesdone);
updateData("bimsycols",objBimsymanager.colsunlocked);

saveGame();

drawScript=function(x,y){
	draw_sprite_tiled(sprBimsygameoverbg,0,current_time*0.001,0);
	draw_sprite_ext(sprBImsygameovertext,0,0,tity+sin(current_time*0.0013),1,1,0,-1,1);
	draw_sprite_ext(objBimsymanager.gameoverhead,0,64,26+cos(current_time*0.003)*2,1,1,0,-1,1);
	
	draw_set_font(fntSilver);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_colour($e8fff5);
	draw_text_ext(64,64,"Score: "+string(objBimsymanager.bimscore),14,96);
	draw_text_ext(64,80,quote,14,120);
	
	draw_text_ext(64,112,"Press Z.",6,96);
}
