if live_call() return live_result;

event_inherited();

surf1=-1;
surf2=-1;
surf3=-1;

bossPartSystem=part_system_create();
part_system_automatic_draw(bossPartSystem, false);
part_system_automatic_update(bossPartSystem, false);

bossBackgroundParticle=part_type_create();
part_type_sprite(bossBackgroundParticle, sprMumbaLightCircle, false, false, false);
part_type_size(bossBackgroundParticle, 0, 0, .01, .005);
part_type_color1(bossBackgroundParticle, c_red);
part_type_alpha3(bossBackgroundParticle, .2, .5, 0);
part_type_life(bossBackgroundParticle, 600, 900);
part_type_direction(bossBackgroundParticle, 0, 360, .2, .1);
part_type_speed(bossBackgroundParticle, .01, .05, 0, .02);

drawScript=function(x, y) {
	var dx=drawX, dy=drawY;
	with parentWindow {
		dx+=cameraX*other.cameraXMultiplier;
		dy+=cameraY*other.cameraYMultiplier;
	}
	
	if !surface_exists(surf1) surf1=surface_create(GAME_WIDTH, GAME_HEIGHT);
	if !surface_exists(surf2) surf2=surface_create(GAME_WIDTH, GAME_HEIGHT);
	
	surface_set_target(surf1);
	draw_clear_alpha(0, 0);
	draw_sprite_tiled(sprite_index, image_index, dx+sprite_xoffset, dy+sprite_yoffset);
	part_system_drawit(bossPartSystem);
	surface_reset_target();
	
	surface_set_target(surf2);
	var m=4;
	setWaveShader(GAME_WIDTH*m, GAME_HEIGHT*m, 1, 1, gameFrame);
	draw_surface(surf1, 0, 0);
	shader_reset();
	surface_reset_target();
	
	var h=(gameFrame/2)%255,
	s=255*wave(.7, 1, 8, .6),
	v=255*wave(.5, 1, 12, 3),
	c=make_color_hsv(h, s, v);
	setSwapAmountShader(c, c_white, 1, .2);
	draw_surface(surf2, 0, 0);
	shader_reset();
}