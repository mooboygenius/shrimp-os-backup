if live_call() return live_result;

// Inherit the parent event
event_inherited();

var spd=wave(2, 4, 5);
horizontalSpeed=spd;
verticalSpeed=spd;

drawX+=random_range(-1, 1);
drawY+=random_range(-1, 1);
xScale=wave(1, 1, 100);
yScale=wave(1, 1.1, 100);

drawScript=function(mx, my) {
	var dx=drawX, dy=drawY;
	with parentWindow {
		dx+=cameraX*other.cameraXMultiplier;
		dy+=cameraY*other.cameraYMultiplier;
	}
	
	var h=(gameFrame)%255,
	s=255,
	v=255,
	c=make_color_hsv(h, s, v);
	
	if !surface_exists(surf1) surf1=surface_create(GAME_WIDTH, GAME_HEIGHT);
	if !surface_exists(surf2) surf2=surface_create(GAME_WIDTH, GAME_HEIGHT);
	if !surface_exists(surf3) surf3=surface_create(GAME_WIDTH, GAME_HEIGHT);
	
	surface_set_target(surf1);
	draw_clear_alpha(0, 0);
	draw_sprite_tiled_ext(sprite_index, image_index, dx+sprite_xoffset, dy+sprite_yoffset, xScale, yScale, c_white, 1);
	surface_reset_target();
	
	surface_set_target(surf2);
	var m=wave(.25, 1, 5),
	int=m;
	setWaveShader(GAME_WIDTH*m, GAME_HEIGHT*m, int, int, gameFrame);
	draw_surface(surf1, 0, 0);
	shader_reset();
	gpu_set_blendmode(bm_subtract);
	part_system_drawit(bossPartSystem);
	var o=0,
	xo=0,
	yo=0;
	with parentWindow {
		xo=cameraX;
		yo=cameraY;
	}
	setSwapAmountShader(make_color_hsv(h, s/4, v/2), c_white, 1, 1);
	with mumbaLivingObject {
		draw_sprite(sprite_index, image_index, x+o+xo, y+o+yo);
	}
	shader_reset();
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	surface_set_target(surf3);
	setSwapAmountShader(c, c_white, 1, .2);
	draw_surface(surf2, 0, 0);
	shader_reset();
	surface_reset_target();
	
	shader_set(shRandomStatic);
	shader_set_uniform_f(shader_get_uniform(shRandomStatic, "time"), gameFrame/10);
	shader_set_uniform_f(shader_get_uniform(shRandomStatic, "intensity"), wave(.05, .1, 10));
	draw_surface_ext(surf3, 0, 0, 1, 1, 0, c_white, 1);
	shader_reset();
}

var t=4;
if gameFrame%t==0 {
	repeat (t) part_system_update(bossPartSystem);
}
part_type_size(bossBackgroundParticle, 0, 0, .0025, .005);
//part_type_color_hsv(bossBackgroundParticle, 0, 255, 255, 255, 255, 255);
part_type_color1(bossBackgroundParticle, c_red);
part_type_alpha3(bossBackgroundParticle, 1, 1, 1);
part_type_speed(bossBackgroundParticle, .05, 1, .01, .02);part_particles_create(bossPartSystem, random(GAME_WIDTH), random(GAME_HEIGHT), bossBackgroundParticle, 1);
part_particles_create(bossPartSystem, random(GAME_WIDTH), GAME_HEIGHT, mumbaCinderParticle, 1);