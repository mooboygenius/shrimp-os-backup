if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		timer++;
		shakeCamera(2);
		if timer>60 {
			timer=0;
			state=1;
			makeChodes();
		}
	break;
	
	case 1:
		x=lerp(x, wave(sprite_xoffset, GAME_WIDTH-sprite_xoffset, 5), .2);
		y=lerp(y, wave(sprite_yoffset, 40, 3), .2);
		shotTimer++;
		if shotTimer>90 {
			if grace<2 grace=4;
			if shotTimer>120 {
				playSound(sfxSD3Shot, 100, 1.3);
				for (var i=-1; i<=1; i++) {
					var inst=instance_create_depth(x, y, depth-1, sdSpitWormProjectile);
					with inst {
						sprite_index=sprSDWormProjectile;
						var d=270+i*45,
						spd=3;
						horizontalSpeed=lengthdir_x(spd, d);
						verticalSpeed=lengthdir_y(spd, d);
						angle=d;
					}
				}
				squish=.2;
				shotTimer=0;
			}
		}
		
		if hp<(maximumHp/2) {
			spawnWormTimer++;
			if spawnWormTimer>600 {
				if instance_number(sdBossWorm)<3 {
					var wx=GAME_WIDTH/2,
					wy=32;
					with sdPlayer wx=x;
					with instance_create_depth(wx, -32, depth-1, sdBossWorm) {
						gotoX=wx;
						gotoY=wy;
					}
				}
				spawnWormTimer=0;
			}
		}
		
		respawnChodesTimer++;
		if respawnChodesTimer>600 {
			respawnChodesTimer=0;
			makeChodes();
		}
	break;
	
	case 2:
		timer++;
		if timer>180 {
			playSound(sfxSDFall, 100, 1);
			timer=0;
			verticalSpeed=1;
			state=3;
		}
	break;
	
	case 3:
		verticalSpeed+=.1;
		angle+=verticalSpeed/2;
		if y>GAME_HEIGHT*2 {
			timer=0;
			playSound(sfxSDPlayerDeath, 100, 1.1);
			with game {
				cameraZoomLerp+=.05;
				cameraShake=4;
			}
			with sdPlayer {
				showUI=false;
				canControl=false;
				horizontalSpeed=0;
				verticalSpeed=0;
			}
			state=4;
		}
	break;
	
	case 4:
		timer++;
		if timer>120 {
			timer=0;
			state=5;
		}
	break;
	
	case 5:
		with sdPlayer {
			var px=GAME_WIDTH div 2,
			py=GAME_HEIGHT-64;
			var d=point_direction(x, y, px, py),
			spd=1,
			l=.2;
			horizontalSpeed=lerp(horizontalSpeed, lengthdir_x(spd, d), l);
			verticalSpeed=lerp(verticalSpeed, lengthdir_y(spd, d), l);
			if point_distance(x, y, px, py)<2 {
				horizontalSpeed=0;
				verticalSpeed=-1;
				x=px;
				y=py;
				other.timer=0;
				other.state=6;
			}
		}
	break;
	
	case 6:
		with sdPlayer {
			if y<-GAME_HEIGHT {
				other.timer=0;
				other.state=7;
			}
		}
	break;
	
	case 7:
		timer++;
		if timer>4 {
			timer=0;
			rectangleHeight+=8;
		}
		with sdPlayer {
			if surface_exists(uiSurface) {
				surface_set_target(uiSurface);
				var left=0, right=GAME_WIDTH, bottom=GAME_HEIGHT, top=bottom-other.rectangleHeight, c=BLACK_COLOR;
				draw_rectangle_color(left, top, right, bottom, c, c, c, c, false);
				surface_reset_target();
			}
		}
		if rectangleHeight>GAME_HEIGHT {
			state=8;
			timer=0;
		}
	break;
	
	case 8:
		timer++;
		if timer>60 {
			room_goto(rmShrimpDefenderEnding);
		}
	break;
	
}

chodeTime+=chodeRotateSpeed;

chodeRotateSpeed=wave(-1, 1, 10)*4;

var lw=wave(-2, 2, 2),
lx=sprite_xoffset+16+lw,
ly=sprite_yoffset+16+lw;
for (var i=0; i<chodeCount; i++) {
	var f=i/6,
	d=f*360+chodeTime;
	with chodeShield[| i] {
		horizontalSpeed=0;
		verticalSpeed=0;
		var gx=other.x+lengthdir_x(lx, d),
		gy=other.y+lengthdir_y(ly, d),
		r=.2;
		x=lerp(x, gx, r);
		y=lerp(y, gy, r);
		depth=-y;
	}
}

if rectangleHeight>0 {
	with sdPlayer {
		if surface_exists(uiSurface) {
			surface_set_target(uiSurface);
			var left=0, right=GAME_WIDTH, bottom=GAME_HEIGHT, top=bottom-other.rectangleHeight, c=BLACK_COLOR;
			draw_rectangle_color(left, top, right, bottom, c, c, c, c, false);
			surface_reset_target();
		}
	}
}