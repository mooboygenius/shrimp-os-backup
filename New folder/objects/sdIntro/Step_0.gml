if live_call() return live_result;

var surfExists=surface_exists(surf);

var zoomOutCamera=function(l=.002) {
	with game {
		cameraZoom=lerp(cameraZoom, 1, l);
	}
}

var drawTextToSurface=function(dt="", dx=GAME_WIDTH div 2, dy=GAME_HEIGHT div 2) {
	/// @function drawTextToSurface([text], [x], [y])
	if surface_exists(surf) {
		surface_set_target(surf);
		if showText>60 || showText%3==0 {
			draw_text(dx, dy, dt);
		}
		surface_reset_target();
	}
	showText++;
}

if !audio_is_playing(bgmSDLevel1Intro) && !audio_is_playing(bgmSDLevel1Loop) playMusic(bgmSDLevel1Loop); 

switch state {
	case 0:
		with game {
			cameraZoom=.1;
		}
		timer++;
		if timer>60 {
			timer=0;
			state=1;
		}
	break;
	
	case 1:
		zoomOutCamera();
		
		drawTextToSurface("worm defense systems\nonline");
		
		timer++;
		if timer>180 {
			timer=0;
			state=2;
		}
	break;
	
	case 2:
		zoomOutCamera();
		
		timer++;
		if timer>30 {
			timer=0;
			state=3;
		}
	break;
	
	case 3:
		zoomOutCamera(.004);
		
		var text="FIGHTING",
		o=60,
		int=o;
		
		var doEffect=true;
		if timer>=int {
			text+="\nSPIRIT";
			int+=o;
			if timer>=int {
				text+="\nENGAGED";
				int+=o;
				if timer>=int {
					shakeCamera(6);
					player=instance_create_depth(GAME_WIDTH div 2, GAME_HEIGHT+64, -10, sdPlayer);
					with player {
						canControl=false;
						grace=20;
						showUI=false;
						showUILerp=0;
					}
					state=4;
					timer=0;
					doEffect=false;
				}
			}
		}
		if timer%o==0 && doEffect {
			show_debug_message("buhhub");
			shakeCamera(3);
			with game {
				cameraZoom+=.16;
				cameraZoom=min(cameraZoom, 1);
				show_debug_message(cameraZoom);
			}
		}
		
		timer++;
		
		drawTextToSurface(text);
	break;
	
	case 4:
		var t=GAME_HEIGHT-32;
		with player {
			y=lerp(y, t, .1);
			if point_distance(0, y, 0, t)<16 {
				y=t;
				canControl=true;
				other.state=5;
				unlockMedal("Shrimp Defender");
			}
		}
	break;
	
	case 5:
		if surfExists {
			surface_set_target(surf);
			var tx=GAME_WIDTH div 2,
			ty=GAME_HEIGHT div 2;
			draw_sprite_ext(sprSDTitle, 0, tx, ty, logoScale+logoSquish, logoScale-logoSquish, 0, c_white, 1);
			surface_reset_target();
		}
		timer++;
		
		var r=.1;
		if logoScale>=1.1 {
			logoSquish+=.2;
			r=0;
		} else if logoScale>=.8 {
			r*=.025;
		}
		
		if logoSquish>=1 {
			state=6;
		}
		
		logoScale+=r;
	break;
	
	case 6:
		timer++;
		if timer>60 {
			timer=0;
			showText=0;
			state=7;
			with player {
				showUI=true;
			}
		}
	break;
	
	case 7:
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		drawTextToSurface("arrow keys to move\nspace bar to shoot");
		timer++;
		if timer>180 {
			instance_create_depth(0, 0, 0, sdLevel1);
			timer=0;
			state=8;
			instance_destroy();
		}
	break;
}