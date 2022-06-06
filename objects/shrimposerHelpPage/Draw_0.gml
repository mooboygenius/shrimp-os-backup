if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_set_font(fntFancy);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(blueColor);
	var tx=16,
	w=portWidth-tx,
	ty=80+scrollYLerp,
	sep=12;
	draw_text_ext(tx, ty, "-Setup-\n\nTo start, download Shrimposer from the \"Download\" page.\n\nOnce Shrimposer is downloaded, you can create new Shrimposer files by right-clicking your shrimptop, selecting \"Make new thing\", followed by \"Song\".\n\nIf all Shrimposer files on the shrimptop are deleted, you will lose the ability to create new ones and you will have to re-download Shrimposer from this website.\n\nOpen a Shrimposer music file to get started.\n\n\n-Use-\n\nShrimposer is very easy to use. Select an instrument from the bottom at click around the upper area to place notes with that instrument. See the bar on the left to see what area corresponds to what note. Scroll around the staff with the mouse scroll wheel.\n\nTo play your track, hit the green triangluar play button at the bottom of the program window.", sep, w);
	draw_set_color(c_white);
	surface_reset_target();
	scrollMinimum=-376;
}