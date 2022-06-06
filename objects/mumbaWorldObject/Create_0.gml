if live_call() return live_result;

mask_index=sprite_index;
visible=false;

event_inherited();

defaultDrawScript=function(x, y) {
	/// @function defaultDrawScript(x, y)
	var dx=x,
	dy=y,
	dxs=image_xscale*xScale,
	dys=image_yscale*yScale,
	dang=angle+image_angle;
	if squish>.1 || squish<-.1 {
		dxs+=sign(dxs)*squish;
		dys-=sign(dys)*squish;
	}
	if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
	draw_sprite_ext(sprite_index, image_index, dx, dy, dxs, dys, dang, image_blend, image_alpha);
	if grace>0 shader_reset();
}

drawScript=function(x, y) {
	/// @function drawScript(x, y)
	defaultDrawScript(x, y);
}

getHurt=function(amt) {
	/// @function getHurt(amount)
	if object_is_ancestor(object_index, mumbaLivingObject) {
		grace=amt*10;
		hp-=amt;
	}
}

hurt=function(in, amt) {
	/// @function hurt(instance, amount)
	with in {
		getHurt(amt);
	}
}

doScreenWrap=function() {
	/// @function doScreenWrap()
	var w=0;
	with mumbaLevel {
		w=tileSurfaceWidth;
	}
	if w>0 {
		if x<0 {
			x=w;
		} else if x>w {
			x=0;
		}
	}
}

useMumbaPhysics=function() {
	/// @function useMumbaPhysics()
	
	if canMove { 
		var h=horizontalSpeed+horizontalKnockback;
		if canCollide && place_meeting(x+h, y, mumbaWall) {
			while !place_meeting(x+sign(h), y, mumbaWall) {
				x+=sign(h);
			}
			h=0;
			horizontalSpeed=0;
			horizontalKnockback=0;
		}
		horizontalKnockback=lerp(horizontalKnockback, 0, weight);
		x+=h;
	
		var v=verticalSpeed+verticalKnockback;
		if canCollide && place_meeting(x, y+v, mumbaWall) {
			if v>2 squish=.2;
			
			var a=0;
			while !place_meeting(x, y+sign(v), mumbaWall) && a<100 && y<9999 {
				y+=sign(v);
				a++;
			}
			v=0;
			verticalSpeed=0;
			verticalKnockback=0;
		}
		verticalSpeed+=weight;
		verticalKnockback=lerp(verticalKnockback, 0, weight);
		y+=v;
	}
	
	if wrapAroundScreen {
		doScreenWrap();
	}
}

setCameraFocus=function(object) {
	/// @function setCameraFocus(object)
	with parentWindow {
		cameraFocus=object;
	}
}

setCameraShake=function(amount) {
	/// @function setCameraShake(amount)
	with parentWindow {
		cameraShake=amount;
	}
}

setCameraKick=function(amount, d) {
	/// @function setCameraKick(amount, direction)
	with parentWindow {
		cameraKick+=amount;
		cameraKickDirection=d;
	}
}

createMumbaParticle=function(x, y, particle, system=0) {
	/// @function createMumbaParticle(x, y, particle, [system])
	with parentWindow {
		if system==0 system=particleSystem else if system==1 system=uiParticleSystem;
		part_particles_create(system, x, y, particle, 1);
	}
}

createMumbaTextEffect=function(x, y, str, c=c_white, oc=BLACK_COLOR, l=120, hor=0, ver=0, w=0, cc=false, fnt=fntSystem) {
	/// @function createMumbaTextEffect(x, y, string, [color], [outlineColor], [life], [horizontalSpeed], [verticalSpeed], [weight], [canCollide], [font])
	var te=instance_create_depth(x, y, -100, mumbaTextEffect);
	with te {
		generateText(str, c, oc, fnt);
		life=l;
		horizontalSpeed=hor;
		verticalSpeed=ver;
		weight=w;
		canCollide=cc;
	}
	with parentWindow {
		ds_list_add(children, te);
	}
	return te;
}

stickToWindow=function() {
	/// @function stickToWindow()
	forceDraw=true;
}