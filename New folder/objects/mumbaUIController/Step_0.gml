if live_call() return live_result;

event_inherited();

invShowUI=1-showUI;
showEggs=lerp(showEggs, instance_exists(mumbaEggSpawner)*showUI, .2);

drawScript=function(x, y) {
	if instance_exists(playerReference) {
		#region draw player
		var playerSpr=noone,
		playerSquish=0,
		playerSpeed=0,
		playerKnockback=0;
		with playerReference {
			playerSpr=uiSprite;
			playerSquish=squish;
			playerSpeed=min(1, abs(horizontalSpeed));
			playerKnockback=-abs(horizontalKnockback)*4;
			if grace || other.grace setSwapAmountShader(c_white, c_white, 1, 1);
		}
		var width=0, height=0;
		with parentWindow {
			width=portWidth;
			height=portHeight;
		}
		var playerX=36+playerKnockback, playerY=height-20+bounceY+invShowUI*100, playerYWave=playerY+wave(0, 2, 1)*!playerSpeed+wave(0, 3, .5)*playerSpeed, playerXScale=1+playerSquish, playerYScale=1-playerSquish, playerAngle=wave(-1, 5, 1)*playerSpeed;
		draw_sprite_ext(playerSpr, 0, playerX, playerYWave, playerXScale, playerYScale, playerAngle, c_white, 1);
		shader_reset();
		#endregion
		
		#region draw weapon
		if instance_exists(weaponReference) {
			var gunSpr=noone,
			gunSquish=0,
			gunAngle=0,
			gunFire=0,
			fired=false,
			cs=noone,
			gxo=0,
			gyo=0;
			with weaponReference {
				gunSpr=uiSprite;
				gunSquish=squish;
				gunAngle=abs(angle*2);
				if grace setSwapAmountShader(c_white, c_white, 1, 1);
				if justFired fired=true;
				gunFire=min(0, fireTimer/fireRate*-8)
				cs=uiCasingSprite;
			}
			if sprite_exists(gunSpr) {
				gxo=sprite_get_xoffset(gunSpr);
				gyo=sprite_get_yoffset(gunSpr);
			}
			var gunX=playerX+20+sprite_get_xoffset(gunSpr)+gunFire, gunY=playerY+wave(-1, 1, 1, .2)*!playerSpeed+wave(-2, 2, .75, .1)*playerSpeed, gunXScale=1+gunSquish, gunYScale=1-gunSquish;
			draw_sprite_ext(gunSpr, 0, gunX, gunY, gunXScale, gunYScale, gunAngle, c_white, 1);
			shader_reset();
			if fired {
				var dustX=gunX+gxo,
				dustY=gunY-gyo;
				
				if sprite_exists(cs) {
					var casingX=gunX, casingY=gunY;
					with mumbaWindow {
						part_particles_create(uiParticleSystem, casingX, casingY, mumbaBulletUIParticle, 1);
					}
				}
			}
		}
		#endregion
		
		#region draw health bar
		var maximum=1,
		a=1;
		with playerReference {
			maximum=maximumHp;
			a=hp;
		}
		var healthX=playerX+40,
		healthY=playerY+12;
		for (var i=1; i<=maximum; i++) {
			var spr=sprHealthIcon,
			thisX=healthX,
			thisY=healthY,
			img=i+gameFrame/10;
			if i>a {
				thisY+=wave(-1, 1, 1, i/3);
				spr=sprEmptyHealthIcon;
			}
			thisY+=wave(-1, 1, 1, i/3);
			with parentWindow {
				var shake=cameraShake*2;
				thisX+=random_range(-shake, shake);
				thisY+=random_range(-shake, shake);
			}
			draw_sprite(spr, img, thisX, thisY);
			healthX+=12;
		}
		#endregion
		
		#region draw coins
		var coinImage=gameFrame/4, coinX=playerX-25, coinY=playerY+8+wave(-2, 1, 1, .2), coinXScale=1, coinYScale=1, coinAngle=0;
		draw_sprite_ext(sprMumbaUICoin, coinImage, coinX, coinY, coinXScale, coinYScale, coinAngle, c_white, 1);
		draw_set_font(mumbaEggFont);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		var ctx=coinX+wave(3, 5, 1),
		cty=coinY+4,
		txt="x";
		with mumbaPlayerData {
			txt+=string(money);
		}
		draw_text(ctx, cty, txt);
		#endregion
		
		#region draw eggs
		if showEggs>0 {
			var eggX=GAME_WIDTH-20,
			eggY=GAME_HEIGHT-22+(1-showEggs)*100,
			eggW=wave(0, 1, 1);
			draw_sprite(sprMumbaUIEgg, 0, eggX, eggY+eggW*4);
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			var str="",
			amt=0,
			goal=0,
			hasGoal=false;
			with mumbaPlayer amt=eggs;
			with mumbaRealLevel {
				goal=eggGoal;
				hasGoal=enableGoal;
			}
			if hasGoal {
				str=concat(amt, "/", goal);
			} else {
				str=concat(amt, "x");
			}
			
			draw_text(eggX+8, eggY+12+eggW*3, str);
		}
		#endregion
	}
}

depth=-9999;

bounceY=lerp(bounceY, 0, .2);
/*
if gameFrame%5==0 && ds_list_size(skulls)<instance_number(mumbaEnemy) {
	var this=instance_create_depth(0, 0, 0, mumbaUISkull)
	ds_list_add(skulls, this);
	with parentWindow {
		if !ds_list_find_index(children, this) ds_list_add(children, this);
	}
}

var xo=0;
for (var i=0; i<ds_list_size(skulls); i++) {
	var this=skulls[| i];
	var width=0, height=0;
	with parentWindow {
		if !ds_list_find_index(children, this) ds_list_add(children, this);
		width=portWidth;
		height=portHeight;
	}
	with this {
		var tx=width-20-xo, ty=height-16+other.invShowUI*100+wave(-2, 2, 1, i/4);
		if point_distance(drawX, drawY, tx, ty)>32 {
			drawX=tx;
			drawY=ty;
		}
		drawX=lerp(drawX, tx, .2);
		drawY=lerp(drawY, ty, .2);
		depth=other.depth-i;
	}
	xo+=12;
}

if ds_list_size(skulls)>instance_number(mumbaEnemy) {
	var in=ds_list_size(skulls)-1;
	with skulls[| in] {
		grace=irandom_range(5, 10);
		verticalSpeed=-2;
		state=mumbaSkullState.leave;
		squish=random_range(-.5, .5);
		rotateDir=random_range(-10, 10);
		sprite_index=sprMumbaUISkull;
		image_index=irandom(image_number);
	}
	ds_list_delete(skulls, in);
}