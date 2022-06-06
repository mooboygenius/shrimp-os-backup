if live_call() return live_result;

event_inherited();
draw_set_font(fntSmaller);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_ext_color(x-sprite_width+2, y-sprite_height+1, text, textSep, textWidth, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, 1);