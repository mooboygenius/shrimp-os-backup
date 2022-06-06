if live_call() return live_result;

event_inherited();

state=0;
depth-=10;

buttonDrawScript=function(x, y) {
	/// @function buttonDrawScript(x, y)
	if sprite_exists(buttonSprite) {
		var dx=x,
		dy=y+image_index;
		draw_sprite(buttonSprite, image_index, dx, dy);
	}
}

drawScript=function(x, y) {
	defaultDrawScript(x, y);
	buttonDrawScript(x, y);
}

clickFunction=function() {
	/// @function clickFunction()
	/* do nothing */
}

hoveringOver=false;

clicked=false;