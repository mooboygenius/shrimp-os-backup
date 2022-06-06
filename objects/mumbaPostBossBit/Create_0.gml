if live_call() return live_result;

event_inherited();

state=0;
timer=0;
graySurface=-1;
drawSurface=false;
showText=false;
fade=0;
text=@"Police arrived on the scene and arrested the perpetrator shortly afterwards.

";

drawScript=function(x, y) {
	if surface_exists(graySurface) {
		if drawSurface {
			draw_surface(graySurface, 0, 0);
		}
	} else {
		graySurface=surface_create(GAME_WIDTH, GAME_HEIGHT);
	}
}

depth=-100000;

forceDraw=true;