if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		var surf=-1;
		with parentWindow {
			if surface_exists(childrenObjectSurf) {
				surf=childrenObjectSurf;
			}
		}
		if surface_exists(surf) {
			if surface_exists(graySurface) {
				surface_copy(graySurface, 0, 0, surf);
				state=1;
				drawSurface=true;
				playMumbaMusic(bgmMumbaBossWin);
			}
		}
	break;
	
	case 1:
		with mumbaWorldObject {
			instance_destroy();
		}
		timer++;
		if timer>10 {
			showText=true;
			timer=0;
			state=2;
			showText=true;
			text="Police arrived on the scene and arrested the perpetrator shortly afterwards.";
		}
	break;
	
	case 2:
		timer++;
		if timer>160 {
			timer=0;
			text+="\n\nMumba successfully rescued his eggs and his girlfriend from the kidnapper, but after further investigation he was found guilty of illegal firearm possession in the state of Ohio.";
			state++;
		}
	break;
	
	case 3:
		timer++;
		if timer>480 {
			timer=0;
			text="";
			state=4;
		}
	break;
	
	case 4:
		timer++;
		if timer>150 {
			timer=0;
			text="Fortunately for our hero, Mumba was let off easy with merely a $500.00 fine.";
			state=5;
		}
	break;
	
	case 5:
		timer++;
		if timer>270 {
			timer=0;
			text+="\n\nAfter it was all said and done, Mumba went home and had lots of unprotected sex with his girlfriend and listened to prog rock playlists on Youtube.";
			state=6;
		}
	break;
	
	case 6:
		timer++;
		if timer>480 {
			timer=0;
			state=7;
			text="";
		}
	break;
	
	case 7:
		timer++;
		if timer>120 {
			if timer%20==0 fade+=.15;
			if fade>=1 {
				state=8;
				timer=0;
			}
		}
	break;
	
	case 8:
		timer++;
		if timer>180 {
			timer=0;
			text="God bless the U.S.A.";
			state=9;
		}
	break;
	
	case 9:
		timer++;
		if timer>300 {
			text="";
			state=10;
			timer=0;
		}
	break;
	
	case 10:
		timer++;
		if timer>120 {
			var inst=instance_create_depth(0, 0, 0, mumbaCreditsLevel);
			with parentWindow ds_list_add(children, inst);
			instance_destroy();
		} else if timer>60 {
			stopMumbaMusic();
		}
	break;
}

drawScript=function(x, y) {
	if surface_exists(graySurface) {
		shader_set(shGrayscale);
		draw_surface(graySurface, 0, 0);
		shader_reset();
		if showText {
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_font(fntSystem);
			var p=32,
			sep=14,
			w=GAME_WIDTH-p*2,
			tx=p,
			ty=p/2;
			if chance(.05) tx+=random_range(-1, 1);
			if chance(.05) ty+=random_range(-1, 1);
			draw_set_alpha(fade);
			draw_rectangle_color(0, 0, GAME_WIDTH, GAME_HEIGHT, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, false);
			draw_set_alpha(1);
			drawTextOutlinedGeneral(tx, ty, text, sep, w, WHITE_COLOR, BLACK_COLOR, 1, 1, 0, 1);
		}
	} else {
		graySurface=surface_create(GAME_WIDTH, GAME_HEIGHT);
	}
}