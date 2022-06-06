if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		if grace<-10 grace=2;
		timer++;
		if timer>180 {
			timer=0;
			waveMultiplier=2;
			lerpRate=.2;
			grace=2;
			state=1;
			setCameraShake(4);
		}
	break;
	
	case 1:
		timer++;
		waveMultiplier=random_range(1, 20);
		if timer>30 {
			timer=0;
			state=2;
			lerpRate=.4;
		}
	break;
	
	case 2:
		squish=wave(-1, 1, 2)*.3;
		image_xscale+=.004;
		image_yscale=image_xscale;
		verticalSpeed=lerp(verticalSpeed, 0, .1);
		timer++;
		if timer%5==0 {
			waveMultiplier=5;
			setCameraShake(4);
			grace=2;
			if sprite_index==sprMumbaBossMumba {
				sprite_index=sprMumbaBossMumbaCreepy;
			} else {
				sprite_index=sprMumbaBossMumba;
			}
			drawShake=8;
		}
		
		var t=240;
		if timer>(t-30) {
			waveMultiplier=5;
			sprite_index=sprMumbaBossMumbaCreepy;
			if grace<-8 grace=2;
		}
		
		if timer>t {
			playSound(sfxMumbaLouderExplosion);
			timer=0;
			var fade=instance_create_depth(0, 0, -10000, mumbaBossWhiteFlash),
			boss=instance_create_depth(x, y, depth, mumbaBoss);
			with parentWindow {
				ds_list_insert(children, 0, boss);
				ds_list_add(children, fade);
			}
			instance_destroy();
		}
	break;
}

waveMultiplier=lerp(waveMultiplier, 30, lerpRate);
drawScript=function(x, y) {
	var m=waveMultiplier;
	setWaveShader(m, m, 10/m, 10/m, (gameFrame div 3*5)*10);
	var s=drawShake*2+8;
	draw_sprite_ext(sprite_index, image_index, x+random_range(-s, s), y+random_range(-s, s), xScale*image_xscale+squish, yScale*image_yscale-squish, angle, c_white, .5);
	defaultDrawScript(x+random_range(-drawShake,drawShake), y+random_range(-drawShake, drawShake));
	shader_reset();
}

horizontalKnockback=0;
verticalKnockback=0;
drawShake=lerp(drawShake, 0, .2);