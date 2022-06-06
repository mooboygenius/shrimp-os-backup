if live_call() return live_result;

// Inherit the parent event
event_inherited();

logo=instance_create_depth(-100, -100, depth-10, button);
with logo {
	sprite_index=sprKrillitLogo;
	visible=false;
	clickFunction=function() {
		with parentWindow {
			createNewPage(krillitFrontPage);
		}
	}
}
ds_list_add(children, logo);

orangeColor=$3389FF;

onlineUsers=irandom_range(9999, 1);
extraText=choose(
"please go outside",
"get a life",
"you're pathetic",
"just go away",
"stop wasting your time",
"do something better"
);