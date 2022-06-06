if live_call() return live_result;

setText=function(str="") {
	/// @function setText(text)
	bounceY=-4;
	text=str;
}

switch state {
	case 0:
		timer++;
		if !audio_is_playing(bgmShrimpOS) playMusicFromIndex(0);
		if timer>300 {
			timer=0;
			state=1;
			instance_destroy(loading);
			setText();
		}
	break;
	
	case 1:
		timer++;
		if timer>60 {
			setText("Welcome to Shrimp-OS!");
			timer=0;
			state=2;
		}
	break;
	
	case 2:
		timer++;
		if timer>120 {
			timer=0;
			state++;
			bounceY=-1;
			text+="\n\nSetup is nearly complete,\nwe just need your input\nfor a few things.";
		}
	break;
	
	case 3:
		timer++;
		if timer>300 {
			timer=0;
			setText();
			state++;
		}
	break;
	
	case 4:
		timer++;
		if timer>60 {
			timer=0;
			setText("You will be able to change\nall of these settings later,\nso don't feel pressured.");
			state++;
		}
	break;
	
	case 5:
		timer++;
		if timer>360 {
			timer=0;
			state=6;
			setText();
		}
	break;
	
	case 6:
		timer++;
		if timer>60 {
			timer=0;
			state=7;
			setText("First, please input a name\nfor Shrimp-OS to identify you as.");
			namePrompt=instance_create_depth(GAME_WIDTH div 2, 3/4*GAME_HEIGHT, -10, firstTimeNamePrompt);
			failedNameAttempts=0;
		}
	break;
	
	case 7:
		if input(vk_enter, PRESS) {
			var n="";
			with namePrompt {
				n=text;
			}
			if string_length(n)<=1 {
				switch failedNameAttempts {
					case 0: setText("Please input a name\nlonger than a single character.") break;
					case 1: setText("Input an actual name.") break;
					case 2: setText("Put in an actual name.") break;
					case 3: setText("Do it.\nNow.") break;
					case 4: setText("You're only wasting your time.") break;
					case 5: setText("Stop fucking around.") break;
					case 6: setText("You won't like what comes next.") break;
					case 7: setText("This is your last chance.") break;
					case 8:
						show_message(concat("SEE YOU SOON.\n", irandom_range(50, 300), ".", irandom_range(50, 300), ".", irandom_range(50, 300), ".", irandom_range(50, 300)));
						game_end();
					break;
				}
				failedNameAttempts++;
			} else {
				var sl=string_lower(n);
				if (sl=="shrimp os" || sl=="shrimpos" || sl=="shrimp-os") || ((sl=="jack" || sl=="milkbarjack" || sl=="mbjack") && os_browser!=browser_not_a_browser && ng_get_username()!="Jack") {
					setText("Nice try, dumbass.\nThat one's taken.\nTry another.");
				} else {
					instance_destroy(namePrompt);
					enteredName=n;
					state=8;
					setText();
				}
			}
		}
	break;
	
	case 8:
		timer++;
		if timer>60 {
			timer=0;
			setText(concat("You set your name to\n\"", enteredName, ".\""));
			state++;
		}
	break;
	
	case 9:
		timer++;
		if timer>60 {
			var ngName=ng_get_username(),
			testName=string_lower(string_letters(enteredName));
			ngName=string_lower(string_letters(ngName));
			show_debug_message(concat("detected ng name as ", ngName));
			
			// different ng name than input name
			if ngName!="" && ngName!=testName {
				switch substate {
					case 0:
						subtimer++;
						if subtimer>90 {
							substate=1;
							subtimer=0;
							text+=concat("\n\nI think I would've preferred \"", ng_get_username(), ".\"");
						}
					break;
					
					case 1:
						subtimer++;
						if subtimer>150 {
							text+="\n\nWhatever, though.\nYour funeral.";
							subtimer=0;
							substate=2;
						}
					break;
					
					case 2:
						subtimer++;
						if subtimer>150 {
							text+=concat("\n\n\"", enteredName, ".\"");
							subtimer=0;
							substate=3;
						}
					break;
					
					case 3:
						subtimer++;
						if subtimer>210 {
							subtimer=0;
							substate=0;
							state++;
							timer=0;
							text="";
						}
					break;
				}
			} else {
				if timer>210 {
					text="";
					state++;
					timer=0;
				}
			}
		}
	break;
	
	case 10:
		timer++;
		if timer>60 {
			timer=0;
			var h=current_hour,
			m=current_minute,
			d="AM";
			if h>=12 d="PM";
			h=h%12;
			if h==0 h=12;
			m=string_replace_all(string_format(m, 2, 0), " ", "0");
			setText(concat("Can you confirm this time is correct?\n\n", h, ":", m, " ", d));
			state=11;
			var bx=GAME_WIDTH div 2,
			by=3/4*GAME_HEIGHT,
			d=40;
			timeYesButton=instance_create_depth(bx-d, by, -10, textButton);
			timeNoButton=instance_create_depth(bx+d, by, -10, textButton);
			var s=2;
			with timeYesButton {
				text="Yes";
				lockSize=true;
				image_xscale=s;
				sprite_index=sprButton;
				clickFunction=function() {
					with button instance_destroy();
					with firstTimeController {
						setText();
						state=12;
					}
				}
			}
			with timeNoButton {
				text="No";
				lockSize=true;
				image_xscale=s;
				sprite_index=sprButton;
				clickFunction=function() {
					with button instance_destroy();
					with firstTimeController {
						setText();
						state=13;
					}
				}
			}
		}
	break;
	
	case 11:
	break;
	
	case 12:
		switch substate {
			case 0:
				subtimer++;
				if subtimer>60 {
					setText("Great! We're almost done with your setup.");
					subtimer=0;
					substate=1;
				}
			break;
			
			case 1:
				subtimer++;
				if subtimer>120 {
					text+="\n\nJust one more question...";
					subtimer=0;
					substate=2;
				}
			break;
			
			case 2:
				subtimer++;
				if subtimer>120 {
					setText();
					subtimer=0;
					substate=0;
					state=20;
				}
			break;
		}
	break;
	
	case 13:
		switch substate {
			case 0:
				subtimer++;
				if subtimer>60 {
					setText("...Oh...");
					subtimer=0;
					substate=1;
				}
			break;
			
			case 1:
				subtimer++;
				if subtimer>90 {
					text+="\n\nThat's okay...\nWe can work it out later...";
					subtimer=0;
					substate=2;
				}
			break;
			
			case 2:
				subtimer++;
				if subtimer>180 {
					text+="\n\nOne more question...";
					subtimer=0;
					substate=3;
				}
			break;
			
			case 3:
				subtimer++;
				if subtimer>120 {
					setText();
					subtimer=0;
					substate=0;
					state=20;
				}
			break;
		}
	break;
	
	case 20:
		timer++;
		if timer>120 {
			timer=0;
			var s=2,
			bx=GAME_WIDTH div 2,
			by=3/4*GAME_HEIGHT,
			d=40;
			finalYesButton=instance_create_depth(bx-d, by, -10, textButton);
			finalNoButton=instance_create_depth(bx+d, by, -10, textButton);
			with finalYesButton {
				text="Yes";
				lockSize=true;
				image_xscale=s;
				sprite_index=sprButton;
				clickFunction=function() {
					with button instance_destroy();
					with firstTimeController {
						setText();
						state=22;
					}
				}
			}
			with finalNoButton {
				text="No";
				lockSize=true;
				image_xscale=s;
				sprite_index=sprButton;
				clickFunction=function() {
					with button instance_destroy();
					with firstTimeController {
						audio_stop_all();
						setText();
						state=23;
					}
				}
			}
			
			if chance(.99) {
				setText("Are you excited to begin\nthe Shrimp-OS experience?!");
			} else {
				audio_stop_all();
				setText(choose("Are you afraid of dying", "Have you ever hurt somebody", "Do you want to turn off\nthe jumpscares?", "Stay still.\nDon't look behind you.", "Do you ever want more\nout of existence?", "Do you feel it too?"));
				
				with finalYesButton {
					clickFunction=function() {
						with button instance_destroy();
						with firstTimeController {
							setText();
							state=24;
						}
					}
				}
				
				with finalNoButton {
					clickFunction=function() {
						with button instance_destroy();
						with firstTimeController {
							setText();
							state=24;
						}
					}
				}
			}
			state=21;
		}
	break;
	
	case 22:
		switch substate {
			case 0:
				subtimer++;
				if subtimer>60 {
					setText("Great!\nThen let's start!");
					subtimer=0;
					substate=1;
				}
			break;
			
			case 1:
				subtimer++;
				if subtimer>180 {
					instance_destroy();
					instance_create_depth(0, 0, -10000, firstTimeTransition);
				}
			break;
		}
	break;
	
	case 23:
		switch substate {
			case 0:
				subtimer++;
				if subtimer>60 {
					setText("Oh...\nSorry...");
					subtimer=0;
					substate=1;
				}
			break;
			
			case 1:
				subtimer++;
				if subtimer>180 {
					instance_destroy();
					instance_create_depth(0, 0, -10000, firstTimeTransition);
				}
			break;
		}
	break;
	
	case 24:
		switch substate {
			case 0:
				subtimer++;
				if subtimer>180 {
					instance_destroy();
					instance_create_depth(0, 0, -10000, firstTimeTransition);
				}
			break;
		}
	break;
}

if input(mb_left) && timer>0 timer+=2;
if input(mb_left) && subtimer>0 subtimer+=2;

bounceY=lerp(bounceY, 0, .5);