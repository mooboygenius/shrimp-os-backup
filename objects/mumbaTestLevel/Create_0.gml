if live_call() return live_result;

event_inherited();

//tileSet=tlsMumbaBlank;

generateLevelMapArray([
"                        ",
"                        ",
"                        ",
"                        ",
"                        ",
"                        ",
"                        ",
"                        ",
"                        ",
"                        ",
"                        ",
"111111111111111111111111",
"111111111111111111111111",
"111111111111111111111111",
"111111111111111111111111",
]);

generateMap();
/*
drawScript=function(x, y) {
	if surface_exists(tileSurface) {
		draw_surface(tileSurface, x, y);
		draw_set_font(fntSystem);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(1, 1, concat("enemies: ", instance_number(mumbaEnemy), "\nfps: ", round(fps), "\nreal fps: ", round(fps_real)));
	}
}