if live_call() return live_result;
var dx=sprite_width div 2,
dy=sprite_height div 2;
draw_sprite(lastSprite, 0, dx-swap, dy);
draw_sprite(sprite_index, 0, dx+sprite_width-swap, dy);