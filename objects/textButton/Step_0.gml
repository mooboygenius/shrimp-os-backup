if live_call() return live_result;

event_inherited();

draw_set_font(font);
textWidth=string_width(text)+12;
textHeight=18;
if !lockSize {
	image_xscale=textWidth/sprite_get_width(sprite_index);
	image_yscale=textHeight/sprite_get_height(sprite_index);
}