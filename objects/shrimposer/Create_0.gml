if live_call() return live_result;

event_inherited();

setWindowSize(self, x, y, 200, 140);
notes=ds_list_create();
selections=ds_list_create();
var array=[selectBaby, selectDog, selectBuzz, selectClock, selectCoin, selectCrow, selectBell, selectDodgeBall, selectGiggle, selectKitty, selectKnife, selectPuppy, selectPig, selectRecordScratch, selectWhistle, selectBurp, selectShrimp];
for (var i=0; i<array_length(array); i++) {
	var inst=instance_create_depth(-100, -100, depth+4, array[i]);
	ds_list_add(selections, inst);
	ds_list_add(children, inst);
}

mouseInstrument=instance_create_depth(-100, -100, depth+1, dragInstrument);
ds_list_add(children, mouseInstrument);

player=instance_create_depth(-100, -100, depth+1, shrimposerPlayer);
ds_list_add(children, player);

playButton=instance_create_depth(-100, -100, depth+4, playStopButton);
ds_list_add(children, playButton);

scrollBar=instance_create_depth(-100, -100, depth+4, shrimposerScrollBar);
ds_list_add(children, scrollBar);

audio_pause_sound(currentMusic);

substate=0;

scrollAmount=0;
scrollAmountLerp=0;

maximumScroll=0;
minimumScroll=-GAME_WIDTH*8;

loadFileData=function(str) {
	var in=1,
	skip=8,
	editStr=string_replace_all(str, "\n", "");
	show_debug_message(concat(editStr));
	while in<string_length(editStr) {
		var this=string_copy(editStr, in, skip),
		obj=string_copy(this, 1, 1),
		xs=string_copy(this, 2, 4),
		ys=string_copy(this, 6, 2),
		m=string_copy(this, 8, 1);
		
		xs=real(xs);
		ys=real(ys);
		switch obj {
			case "0": obj=instrumentBaby break;
			case "1": obj=instrumentDog break;
			case "2": obj=instrumentCoin break;
			case "3": obj=instrumentBuzz break;
			case "4": obj=instrumentClock break;
			case "5": obj=instrumentCrow break;
			case "6": obj=instrumentBell break;
			case "7": obj=instrumentDodgeBall break;
			case "8": obj=instrumentGiggle break;
			case "9": obj=instrumentKitty break;
			case "a": obj=instrumentKnife break;
			case "b": obj=instrumentPuppy break;
			case "c": obj=instrumentPig break;
			case "d": obj=instrumentRecordScratch break;
			case "e": obj=instrumentWhistle break;
			case "f": obj=instrumentBurp break;
			case "g": obj=instrumentShrimp break;
			case "h": obj=instrument break;
		}
		
		show_debug_message(concat("set mode to ", m, "\n"));
		
		if !is_string(obj) && !is_string(xs) && !is_string(ys) {
			var inst=instance_create_depth(xs, ys, depth-10, obj);
			with inst {
				visible=false;
				mode=m;
				event_perform(ev_create, 0);
				
			}
			ds_list_add(notes, inst);
			ds_list_add(children, inst);
		}
		
		in+=skip;
	}
}

saveSong=function() {
	/// @function saveSong()
	var txt="";
	
	for (var i=0; i<ds_list_size(notes); i++) {
		with notes[| i] {
			show_debug_message("ayo");
			switch object_index {
				case instrumentBaby: txt+="0" break;
				case instrumentDog: txt+="1" break;
				case instrumentCoin: txt+="2" break;
				case instrumentBuzz: txt+="3" break;
				case instrumentClock: txt+="4" break;
				case instrumentCrow: txt+="5" break;
				case instrumentBell: txt+="6" break;
				case instrumentDodgeBall: txt+="7" break;
				case instrumentGiggle: txt+="8" break;
				case instrumentKitty: txt+="9" break;
				case instrumentKnife: txt+="a" break;
				case instrumentPuppy: txt+="b" break;
				case instrumentPig: txt+="c" break;
				case instrumentRecordScratch: txt+="d" break;
				case instrumentWhistle: txt+="e" break;
				case instrumentBurp: txt+="f" break;
				case instrumentShrimp: txt+="g" break;
				case instrument: txt+="h" break;
			}
		
			txt+=string_replace_all(string_format(startX, 4, 0), " ", "0");
			txt+=string_replace_all(string_format(startY, 2, 0), " ", "0");
			txt+=concat(mode);
			txt+="\n";
		}

	}

	show_debug_message(concat("saved shrimposer:\n", txt));

	with myFile {
		saveInfo=txt;
	}
	
	saveDesktopFiles();
}

if !loadData("openedShrimposer", false) || chance(.02) {
	with createShrimpy("You can create new Shrimposer files by right clicking the desktop and selecting \"Make new thing\" followed by \"Song.\"") {
		destroyScript=function() {
			timer++;
			if timer>600 state=1;
		}
	}
	updateData("openedShrimposer", true);
	saveGame();
}

unlockMedal("Shrimp Sounds");