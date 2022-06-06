if live_call() return live_result;

addChildrenToParentWindow(children);

event_inherited();

switch state {
	case 0:
		if !instance_exists(mumbaCircleTransition) {
			timer++;
			if timer>30 {
				state=1;
				timer=0;
			}
		}
	break;
	
	case 1:
		card=instance_create_depth(0, 0, depth-100-current, mumbaIntroCard);
		with card {
			drawX=-200;
			drawY=GAME_HEIGHT div 2;
			sprite_index=other.images[other.current];
			angle=random_range(-1, 1)*40;
		}
		ds_list_add(children, card);
		copy=-30;
		state=2;
	break;
	
	case 2:
		with card {
			if point_distance(drawX, drawY, goalX, goalY)<8 {
				other.state=3;
			}
		}
	break;
	
	case 3:
		copy+=.5;
		if copy>0 currentText=string_copy(text[current], 1, copy);
		if copy>=string_length(text[current]) {
			timer++;
			if timer>180 {
				timer=0;
				copy=0;
				currentText="";
				current++;
				if current>=array_length(text) {
					state=4;
				} else {
					state=0;
				}
			}
		}
	break;
	
	case 4:
		timer++;
		if timer>30 {
			timer=0;
			circleTransition=instance_create_depth(0, 0, -1000, mumbaCircleTransition);
			with circleTransition {
				circleX=GAME_WIDTH/2;
				circleY=GAME_HEIGHT/2;
				circleSize=GAME_WIDTH*2;
				circleChange=-8;
			}
			with parentWindow ds_list_add(children, other.circleTransition);
			state=5;
		}
	break;
	
	case 5:
		var go=false;
		with circleTransition {
			if circleSize<=0 go=true;
		}
		
		if go {
			state=6;
			stopMumbaMusic();
		}
	break;
	
	case 6:
		timer++;
		if timer>60 {
			instance_destroy();
			with mumbaIntroCard {
				instance_destroy();
			}
			var inst=instance_create_depth(0, 0, 0, mumbaLevelSelectController);
			with parentWindow ds_list_insert(children, 0, inst);
			with circleTransition {
				circleChange*=-1;
				destroyAtSize=GAME_WIDTH*2;
			}
		}
	break;
}


drawScript=function(dx, dy) {
	draw_clear_alpha($2B1D29, 1);
	setSwapAmountShader(BLACK_COLOR, c_white, 1, 1);
	var o=8;
	with mumbaIntroCard {
		draw_sprite_ext(sprite_index, image_index, drawX+o, drawY+o, xScale+squish, yScale-squish, angle, c_white, 1);
	}
	shader_reset();
	draw_set_font(mumbaShopFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(WHITE_COLOR);
	var sep=14, w=GAME_WIDTH;
	draw_text_ext_color(GAME_WIDTH div 2+1, 3/4*GAME_HEIGHT+1, currentText, sep, w, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, BLACK_COLOR, 1);
	draw_text_ext(GAME_WIDTH div 2, 3/4*GAME_HEIGHT, currentText, sep, w);
}