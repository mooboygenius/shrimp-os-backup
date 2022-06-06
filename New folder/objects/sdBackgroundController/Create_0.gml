if live_call() return live_result;
backgroundSpeed=1;
backgroundSpeedLerp=backgroundSpeed;
backs=ds_list_create();
var objs=[sprShrimpDefenderBack4, sprShrimpDefenderBack3, sprShrimpDefenderBack2, sprShrimpDefenderBack1];
for (var i=0; i<array_length(objs); i++) {
	var inst=instance_create_depth(0, 0, -i*10, sdBackground);
	with inst {
		hasShadow=i>0;
		sprite_index=objs[i];
		x=0;
		y=0;
		verticalSpeed=i+1;
		depth=-i+2;
		if i>0 {
			drawScript=function(x, y, scale=1) {
				var int=1,
				m=5,
				t=gameFrame*1,
				dx=x,
				dy=y;
				setWaveShader(sprite_width*m, sprite_height*m, int, int, t);
				
				if scale<1 {
					dx-=16;
					var p=1000,
					top=-p,
					bottom=GAME_HEIGHT+p;
					draw_rectangle(0, 0, dx, GAME_HEIGHT, false);
					draw_rectangle(dx+160, 0, GAME_WIDTH, GAME_HEIGHT, false);
				}
			
					draw_sprite_tiled_ext(sprite_index, image_index, dx, dy, scale, scale, c_white, 1);
			
				shader_reset();
			}
		}
	}
	ds_list_add(backs, inst);
}