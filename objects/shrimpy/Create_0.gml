if live_call() return live_result;

event_inherited();

state=0;
timer=0;
copy=0;
destroyScript=function() {
	/// @function destroyScript()
	timer++;
	if timer>600 || instance_exists(window) {
		state=1;
	}
}

x=GAME_WIDTH-sprite_xoffset-8;
y=GAME_HEIGHT+sprite_yoffset*2;

text="TEST DIALOGUE";
copy=0;
squish=-1;

textBub=instance_create_depth(x, y, depth, shrimpyTextBubble);
with textBub {
	textWidth=100;
	textSep=6;
}