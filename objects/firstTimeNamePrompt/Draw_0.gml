if live_call() return live_result;

draw_set_color(WHITE_COLOR);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

var width=string_width(text);

lineWidth=lerp(lineWidth, max(32, width), .5);

var dx=GAME_WIDTH div 2,
dy=y+1,
yo=string_height("A")/2;
draw_line(dx-lineWidth/2, dy+yo, dx+lineWidth/2, dy+yo);
draw_text(dx, dy, text);

draw_set_color(c_white);