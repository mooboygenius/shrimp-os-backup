if live_call() return live_result;

event_inherited();

image_index=irandom(image_number);

drawScript=function(x, y) {
	draw_sprite(sprite_index, image_index, x, y);
}