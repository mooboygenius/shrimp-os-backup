if live_call() return live_result;

event_inherited();

var w=0, h=0;

for (var i=0; i<ds_list_size(children); i++) {
	if instance_exists(children[| i]) {
		with parentWindow {
			if ds_list_find_index(children, other.children[| i])<0 {
				ds_list_insert(children, 0, other.children[| i]);
			}
		}
	} else {
		show_debug_message(concat("removing #", i, " from mumba title controller children list"));
		ds_list_delete(children, i);
	}
}

switch state {
	case 0:
		with parentWindow {
			w=portWidth;
			h=portHeight;
		}
		
		centerX=w div 2;
		centerY=h div 2;
		timer++;
		if timer>60 {
			show_debug_message("aaaaa");
			pressPrompt=instance_create_depth(centerX, centerY, depth-100, mumbaTitleStartPrompt);
			with pressPrompt {
				drawX=other.centerX;
				drawY=other.centerY;
			}
			ds_list_add(children, pressPrompt);
			timer=0;
			state=1;
		}
	
	case 1:
		imageScale=lerp(imageScale, wave(1, 1.05, 16), .1);
	
		with title {
			targetY=other.centerY+wave(-1, 1, 2)*8;
			depth=-400;
		}
	
		with pressPrompt {
			depth=-500;
			drawX=other.centerX;
			drawY=other.centerY+56;
		}
		
		if keyboard_check_pressed(vk_anykey) {
			state=2;
			imageScale+=.05;
			playMumbaSound(sfxMumbaMenuConfirm, 100);
			with pressPrompt {
				instance_destroy();
			}
		}
	break;
	break;
	
	case 2:
		imageScale=lerp(imageScale, 1, .01);
		var xs=1,
		t=.8;
		with title {
			state=-1;
			xScale=lerp(xScale, t, .1);
			yScale=xScale;
			xs=xScale;
		}
		if xs<(t+.05) {
			state=3;
		}
	break;
	
	case 3:
		imageScale=lerp(imageScale, 1, .01);
		var go=false;
		with title {
			var l=.2,
			xg=10;
			drawY=lerp(drawY, -350, l);
			xScale=lerp(xScale, xg, l);
			yScale=xScale;
			if xScale>=xg-.5 {
				go=true;
			}
		}
		if go {
			with title {
				instance_destroy();
			}
			state=4;
		}
	break;
	
	case 4:
		imageScale=lerp(imageScale, 1, .01);
		timer++;
		if timer>30 {
			timer=0;
			state=5;
			littleMumba=instance_create_depth(0, 0, -200, mumbaTitleMumba);
			with littleMumba {
				xScale=3
				yScale=xScale;
				drawX=GAME_WIDTH+sprite_xoffset*xScale;
				drawY=GAME_HEIGHT div 2;
				owner=other;
			}
			ds_list_add(children, littleMumba);
		}
	break;
	
	case 6:
		
	case 5:
		centerX=lerp(centerX, 0, .1);
		centerY=lerp(centerY, GAME_HEIGHT div 2+wave(-1, 1, 2)*4, .1);
		if state==5 {
			var go=false;
			with littleMumba {
				if state>=3 {
					go=true;
				}
			}
			if go {
				state=6;
				var inst=instance_create_depth(0, 0, 0, mumbaTitleGeneralMenu);
				with inst {
					targetX=GAME_WIDTH-30;
					targetY=1/3*GAME_HEIGHT;
					drawX=GAME_WIDTH+100;
					drawY=targetY;
					menuHorizontalAlignment=menuHAlign.right;
				}
				ds_list_add(children, inst);
			}
		}
	break;
	break;
}

drawScript=function(x, y) {
	var w=1, h=1;
	with parentWindow {
		w=portWidth;
		h=portHeight;
	}
	
	if !surface_exists(surf1) surf1=surface_create(w, h);
	if !surface_exists(surf2) surf2=surface_create(w, h);
	if surface_exists(surf1) && surface_exists(surf2) {
		if surface_get_width(surf1)!=w || surface_get_width(surf1)!=h surface_resize(surf1, w, h);
		if surface_get_width(surf2)!=w || surface_get_width(surf2)!=h surface_resize(surf2, w, h);
		
		var c1=$E8FFF5,
		c2=$70AEFF,
		c3=BLACK_COLOR,
		c=c3;
		draw_clear_alpha(c, 1);
		
		surface_set_target(surf1);
		draw_clear_alpha(0, 0);
		surface_reset_target();
		surface_set_target(surf2);
		draw_clear_alpha(0, 0);
		surface_reset_target();
	
		var tx1=centerX,
		ty1=centerY,
		a=360 div 10,
		a2=a-3,
		l=400,
		d=2,
		s=0,
		gf=gameFrame*.7;
		
		for (var i=0; i<360; i+=a) {
			if s%2==0 && surface_exists(surf1) {
				surface_set_target(surf1);
			} else if surface_exists(surf2) {
				surface_set_target(surf2);
			}
			var ma=(i-gf);
			//show_debug_message(i);
			var mtx1=tx1+lengthdir_x(d, ma),
			mty1=ty1+lengthdir_y(d, ma),
			tx2=mtx1+lengthdir_x(l, ma),
			ty2=mty1+lengthdir_y(l, ma),
			tx3=mtx1+lengthdir_x(l, ma+a2),
			ty3=mty1+lengthdir_y(l, ma+a2);
			draw_triangle(mtx1, mty1, tx2, ty2, tx3, ty3, false);
			s++;
			surface_reset_target();
		}
		
		gpu_set_colorwriteenable(true, true, true, false);
		surface_set_target(surf1);
		var ix=sprite_get_xoffset(sprMumbaTitleBackground1)+1,
		iy=sprite_get_yoffset(sprMumbaTitleBackground1);
		draw_sprite_ext(sprMumbaTitleBackground1, 0, ix, iy, imageScale, imageScale, 0, c_white, 1);
		surface_reset_target();
		
		surface_set_target(surf2);
		draw_sprite_ext(sprMumbaTitleBackground2, 0, ix, iy, imageScale, imageScale, 0, c_white, 1);
		surface_reset_target();
		gpu_set_colorwriteenable(true, true, true, true);
		
		draw_surface(surf1, 0, 0);
		draw_surface(surf2, 0, 0);
	}
}