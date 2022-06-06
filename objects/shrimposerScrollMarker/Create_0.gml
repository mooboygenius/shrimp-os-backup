if live_call() return live_result;

event_inherited();

leftLimit=0;
rightLimit=1;

holding=false;

clickFunction=function() {
	show_debug_message(concat("now holding @ ", current_time));
	holding=true;
}

clickType=PRESS;