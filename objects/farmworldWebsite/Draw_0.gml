if live_call() return live_result;

event_inherited();

var drawPic=function(spr, desc) {
	/// @function drawPic(spr, text)
	var yo=sprite_get_yoffset(spr);
	picY+=yo;
	var sprx=picX+sprite_get_xoffset(spr);
	draw_sprite(spr, 0, sprx, picY);
	picY+=yo;
	var w=200,
	sep=8;
	picY+=4;
	var t=concat("moods: ", desc),
	c=$c2a7a3;
	draw_text_color(picX, picY, t, c, c, c, c, 1);
	picY+=string_height_ext(t, sep, w);
	picY+=8;
}

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_set_font(fntFarmworld);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_sprite_tiled(sprFarmworldBackground, 0, 0, 0);
	draw_sprite(sprFarmworldPage, 0, GAME_WIDTH div 2, GAME_HEIGHT div 2);
	var tc=BLACK_COLOR,
	tx=64,
	ty=8+scrollYLerp;
	draw_text_color(tx, ty, "Farm World", tc, tc, tc, tc, 1);
	ty+=string_height("\n")-4;
	draw_set_font(fntFarmworldSmall);
	ty+=16;
	picX=68;
	picY=88+scrollYLerp;
	draw_text_color(tx, ty, "best source on the shrimpweb\nfor relaxing farm images", tc, tc, tc, tc, 1);
	draw_set_font(fntSmaller);
	drawPic(sprFWCows, "longing, baby, nostalgia, silly");
	drawPic(sprFWBarn, "home, comfort, barn");
	drawPic(sprFWHungryCows, "doom, hunger, doubt, weary");
	drawPic(sprFWTractor, "love, romance, joy, lust");
	drawPic(sprFWCreepyForest, "mystery, earth, scopaesthesia");
	drawPic(sprFWWeirdTractor, "ancient, monolith, ozymandias");
	drawPic(sprFWChicks, "protection, parental, cigarettes");
	drawPic(sprFWGoat, "died, purity, duality");
	drawPic(sprFWFunnyCow, "bovine, boom bang crash");
	drawPic(sprFWHangers, "screaming");
	draw_set_font(fntSmaller);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	tc=BLACK_COLOR;
	draw_text_color(GAME_WIDTH div 2, picY+20, concat("Farmworld is based at ", irandom_range(100, 999), " Ridgewood Rd.,\nRiver Valley, MI.\nFor all questions, queries, and requests,\nplease mail this address."), tc, tc, tc, tc, 1);
	surface_reset_target();
}

scrollMinimum=-1300;