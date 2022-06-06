if live_call() return live_result;

event_inherited();

image_index=irandom(image_number);

startX=x;
startY=y;
shake=0;
state=0;
timer=0;

drawScript=function(x, y) {
	if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
	draw_sprite_ext(sprite_index, image_index, x+random_range(-shake, shake), y+random_range(-shake, shake), 1+squish, 1-squish, angle, c_white, 1);
	shader_reset();
}

createMumbaParticle=function(x, y, particle, system=0) {
	/// @function createMumbaParticle(x, y, particle, [system])
	with parentWindow {
		show_debug_message("created particle");
		if system==0 system=particleSystem else if system==1 system=uiParticleSystem;
		part_particles_create(system, x, y, particle, 1);
	}
}