if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_sprite_tiled(sprGeorgeFire, gameFrame/5, 0, 0);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fntGeorgeBig);
	var tx=portWidth div 2,
	ty=20+scrollYLerp;
	draw_text(tx, ty, "GARY'S PAGE");
	ty+=48;
	var frame=gameFrame/5,
	a=0;
	for (var i=24; i<GAME_WIDTH; i+=44) {
		var spr=sprGeorgeWeed;
		if a%2==0 spr=sprGeorgeSkull;
		draw_sprite(spr, frame+i/100, i, ty);
		a++;
	}
	ty+=40;
	draw_set_font(fntGeorge);
	draw_text(tx, ty, "WARNING:\nif you are a SISSY, WUSS, PANSY,\nCRYBABY, NE'ERDOWELL, NIMROD,\nOR NUMBSKULL, this page is\nNOT FOR YOU!!\n\nif you are my social studies teacher Mr. Ziegler\nthen GET THE FUCK OFF THIS PAGE\nAND DIE!!!");
	ty+=220;
	draw_sprite(sprGeorgeGary, gameFrame/20, tx, ty);
	ty+=60;
	draw_set_halign(fa_left);
	var left=8,
	w=GAME_WIDTH-left*2,
	sep=14;
	draw_text_ext(left, ty, "Mr Dwayne Ziegler,\n\nYou are a downright despicable trash-heap of a man.The number of grievances you have caused in my short life cannot be counted by the humin mind or fingers.\n\nFirst you told my mom at parent teacher confereces that i was failing your class. This was your first and most certainly not last mistake. You did this because you KNEW she would take my gameboy away as punishment.My fucking gameboy. MY game boy.\n\nSecond, you TOLD ALL OF MY FREINDS that i listen to Weezer. I am lucky to still be holding on to a shred of popuelarity after this little incident.\n\n3rd, YOU SENT ME TO THE PRINCIPLES OFFICE FOR RELEASING WORMS IN YOUR ROOM. THIS. WAS. NOT. ME!!!!!!I told you it was NOAH who did this and you DID NT BELIEVE ME. COULDN'T BE PRECIOUS NOAH.i SAW HIM DOING IT! You just didnt believe me. Everyone knows HE DID IT. Not me. FUCK YOU NOAH.\n\nYou shit my ass.You ass my shit all of the itme and im sick of it. I wont take it any more. I m sick of getting my ass wiped. You're gonna stop wiping my ass. Mr Ziegler is GOING to stop wipeing my ass.\n\nI am going to release 50 mantis shrimps in his shitty studio apartment. I am going to make his life a living hell. He will never sleep a wink again and I will make sure that he is never granted a moment's rest. I will clog that mother fucker's pipes.\n\nthe other day i ran into the bathroom while mr ziegler was sitting on a toilet and i snuck under the stall door and slammed the toilet lid down on his penis", sep, w);
	draw_set_halign(fa_center);
	ty+=580;
	draw_sprite(sprGeorgeSkull, gameFrame/5, tx, ty);
	ty+=40;
	draw_text(tx, ty, "Copyright 2000, Gary Francis Productions co.");
	surface_reset_target();
}

scrollMinimum=-880;