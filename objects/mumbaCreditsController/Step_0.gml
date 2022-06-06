if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		timer++;
		if timer>30 {
			timer=0;
			state=1;
			playMumbaMusic(bgmMumbaCredits, false)
		}
	break;
	
	case 1:
		var w=GAME_WIDTH,
		h=GAME_HEIGHT;
		with mumbaLevel {
			w=tileSurfaceWidth;
			h=tileSurfaceHeight;
		}
	
		timer--;

		if timer<=0 {
			var this=creditsText[| current];
			if is_string(this) {
				var spr=asset_get_index(this);
				
				var inst=instance_create_depth(floor(w/2), h, -100, mumbaCreditsObject);
				with inst {
					if spr {
						sprite_index=spr;
					} else {
						sprite_index=generateSprite(this);
					}
					hp=(sprite_width+sprite_height)/32;
					maximumHp=hp;
					y+=sprite_yoffset;
					ystart=y;
					verticalSpeed=-other.moveSpeed;
					weight=0;
					canCollide=false;
				}
				
				with parentWindow {
					ds_list_add(children, inst);
				}
			} else if is_numeric(this) {
				timer=this;
			}
			
			current++;
			if current>=ds_list_size(creditsText) {
				state=2;
				timer=0;
			}
		}
		
		if gameFrame%10==0 {
			with parentWindow {
				part_particles_create(particleSystem, random(w), random(-64), mumbaConfettiParticle, 1);
			}
		}
	break;
	
	case 2:
		timer++;
		if timer>180 {
			circleTransition=instance_create_depth(0, 0, -1000, mumbaCircleTransition);
			with circleTransition {
				circleX=GAME_WIDTH div 2;
				circleY=GAME_HEIGHT div 2;
				circleSize=GAME_WIDTH*1.5;
				circleChange=-8;
			}
			with parentWindow {
				ds_list_add(children, other.circleTransition);
			}
			state=3;
			timer=0;
		}
	break;
	
	case 3:
		var go=false;
		with circleTransition {
			if circleSize<=0 {
				go=true;
			}
		}
		
		if go {
			instance_destroy(mumbaPlayer);
			instance_destroy(mumbaLivingObject);
			instance_destroy(mumbaWall);
			state=4;
			timer=0;
		}
	break;
	
	case 4:
		timer++;
		if timer>=60 {
			with parentWindow {
				ds_list_insert(children, 0, instance_create_depth(0, 0, 0, mumbaMilkbarLadsIntro));
			}
			with mumbaLevel instance_destroy();
			with circleTransition instance_destroy();
			instance_destroy();
		}
	break;
}