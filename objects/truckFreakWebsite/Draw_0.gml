if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_sprite_tiled(sprTruckFreak, 0, 0, scrollYLerp);
	draw_set_font(fntShrimppad);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var tx=4,
	ty=16+scrollYLerp;
	drawTextOutlinedGeneral(tx, ty, "WWW.TRUCKFREAK.SHRIMP", 12, 999);
	draw_set_font(fntFancy);
	ty+=48;
	draw_sprite(sprMovingTruck, gameFrame/5, 64, ty);
	ty+=40;
	drawTextOutlinedGeneral(tx, ty, "I PLEDGE ALLEGIANCE TO THE FLAG\nOF THE UNITED STATES OF TRUCKMERICA\nAND TO THE BIG RIG\nFOR WHICH IT DOUBLE NICKELS\nONE REST STOP UNDER 7/11\nINDIVISIBLE WITH LIBERTY\nAND DIESEL FOR ALL", 12, 999);
	ty+=120;
	var xx=40;
	repeat(4) {
		draw_sprite(sprAmericanFlag, gameFrame/5, xx, ty);
		xx+=80;
	}
	ty+=40;
	draw_set_font(fntShrimppad);
	drawTextOutlinedGeneral(tx, ty, "trucker lifestyle tips", 12, 999);
	ty+=20;
	draw_set_font(fntMumba);
	drawTextOutlinedGeneral(tx, ty, "- Doctors recommend 3 trucks per meal a day\n- ALWAYS wash you're hands\n- If you don't know the right answer pick C\n- If you're thinking about moving to California\n  DON'T. You won't be able to afford rent\n- let that baby purr!!! YEA!!! FUCK YEA\n- urinate after orgasming", 18, 999);
	ty+=160;
	draw_sprite(sprDopeTruck, gameFrame/10, GAME_WIDTH div 2, ty);
	ty+=40;
	draw_set_font(fntGeorge);
	draw_set_halign(fa_center);
	drawTextOutlinedGeneral(GAME_WIDTH div 2, ty, "~ The future surrounds us, emboldened and enraged. ~", 12, 999);
	draw_set_halign(fa_right);
	draw_set_font(fntSilver);
	ty+=50;
	drawTextOutlinedGeneral(GAME_WIDTH-12, ty, "The Trucker Jokes section\nis UNDER CONSTRUCTION!!\nplease check back soon!!", 12, 999);
	surface_reset_target();
}

scrollMinimum=-480;