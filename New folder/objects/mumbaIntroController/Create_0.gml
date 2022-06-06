if live_call() return live_result;

event_inherited();

circleTransition=noone;

drawScript=function(dx, dy) {
	draw_clear_alpha($2B1D29, 1);
	setSwapAmountShader(BLACK_COLOR, c_white, 1, 1);
	var o=8;
	/*with mumbaWorldObject {
		drawScript(dx+o, dy+o);
	}*/
	shader_reset();
	draw_set_font(mumbaShopFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(WHITE_COLOR);
	var sep=14, w=GAME_WIDTH;
	draw_text_ext_color(GAME_WIDTH div 2+1, 3/4*GAME_HEIGHT+1, currentText, sep, w, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, 1);
	draw_text_ext(GAME_WIDTH div 2, 3/4*GAME_HEIGHT, currentText, sep, w);
}

text=["Mumba lived a peaceful life with\nhis eggs and his hot babe...",
"...Until one day,\nhis beloved eggs and babe\nwere kidnapped by a bad guy!!",
"Go save them, Mumba!!!!!"];

images=[sprMumbaIntroCard1, sprMumbaIntroCard2, sprMumbaIntroCard3];

current=0;
currentText="";
state=0;
timer=0;
copy=0;

children=ds_list_create();
card=noone;

playMumbaMusic(bgmMumbaIntro);