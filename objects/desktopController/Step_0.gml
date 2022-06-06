if live_call() return live_result;
timer++;

if timer%1200==0 {
	//show_debug_message(concat(current_hour, ":", current_minute, ":", current_second, "  DESKTOP FILE AUTOSAVE:"));
	saveDesktopFiles();
}

if timer>60 {
	if !metShrimpy {
		greetedByShrimpy=true;
		metShrimpy=true;
		updateData("metShrimpy", metShrimpy);
		with createShrimpy("My name is Shrimpy -- your virtual assistant!\n\nTo get started, please read the \"Read Me!\" text file!") {
			destroyScript=function() {
				timer++;
				if timer>600 || instance_exists(window) state=1;
			}
		}
		
	} else if !greetedByShrimpy {
		greetedByShrimpy=true;
		
		with createShrimpy("") {
			if chance(.01) {
				text=choose("Hi, this is Shrimpy!\nPlease don't cum in your girlfriend, it's not fair to her.", "We have little time left.\nSpend your remaining moments with your loved ones.", "I don't love you.\nBut who does, anyways?", "Fuck off, I'm sick of you.", "Life is but a fading dream.", concat(irandom_range(50, 300), ".", irandom_range(50, 300), ".", irandom_range(50, 300), ".", irandom_range(50, 300), ".\n\nDoes that sound right?\n\nGreat."));
			} else {
				text=choose("Good to see you again!", "Howdy!", "Hello!", "Shrimply beautiful out, isn't it?")
			}
			
			destroyScript=function() {
				timer++;
				if timer>360 || instance_exists(window) state=1;
			}
		}
	}
}

if (mouse_wheel_down() || mouse_wheel_up()) && instance_exists(window) && !shownScrollSuggestion {
	with createShrimpy("Hold SHIFT while scrolling in Shrimp-OS to prevent the outside page from scrolling!") {
		destroyScript=function() {
			timer++;
			if timer>600 state=1;
		}
	}
	shownScrollSuggestion=true;
	greetedByShrimpy=true;
	metShrimpy=true;
}