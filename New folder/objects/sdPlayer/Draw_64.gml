if live_call() return live_result;

if surface_exists(uiSurface) {
	surface_set_target(uiSurface);
	
	var inv=1-showUILerp;
	
	var p=2,
	wx=sprite_get_xoffset(sprSDWeaponContainerIcon)+p-inv*80,
	wy=GAME_HEIGHT-sprite_get_yoffset(sprSDWeaponContainerIcon)-p-1,
	owy=wy;
	draw_sprite(sprSDWeaponContainerIcon, 0, wx, wy);
	if roundFireTime!=roundFireSetTime {
		wy-=1;
		setSwapAmountShader(WHITE_COLOR, WHITE_COLOR, 1, 1);
	}
	var rc=WHITE_COLOR,
	xo=sprite_get_xoffset(sprSDWeaponContainerIcon),
	yo=sprite_get_yoffset(sprSDWeaponContainerIcon),
	left=wx-xo+3,
	right=wx+xo-4,
	height=(max(0, weaponTimer)/setWeaponTimer)*17,
	bottom=owy+yo-4,
	top=bottom-height;
	if height>0 draw_rectangle_color(left, top, right, bottom, rc, rc, rc, rc, false);
	draw_sprite(weaponSprite, 0, wx, wy);
	shader_reset();
	
	var hpo=sprite_get_xoffset(sprSDHealthIcon),
	hpx=GAME_WIDTH-hpo-p+inv*80,
	hpy=GAME_HEIGHT-sprite_get_yoffset(sprSDHealthIcon)-p;
	
	var i=0,
	hspr=sprSDHealthIcon;
	repeat(max(hp, maximumHp)) {
		var ty=hpy,
		tx=hpx,
		img=0;
		
		if i>=hp {
			img=1;
		} else {
			ty+=wave(-2, 0, .5, i*.33);
			if i==hp-1 && (hurtEffect>0 || (hurtEffect%2==0 && hurtEffect>-20)) {
				img=2;
			}
			if hurtEffect>=15 || (hurtEffect>=0 && hurtEffect%3==0) {
				setSwapAmountShader(WHITE_COLOR, c_white, 1, 1);
			}
			if hurtEffect>=0 {
				tx+=irandom_range(-1, 1);
				ty+=irandom_range(-1, 1);
			}
		}
		
		if i>=maximumHp {
			hspr=sprSDExtraHealthIcon;
		}
		
		draw_sprite(hspr, img, tx, ty);
		shader_reset();
		hpx-=hpo*2-1;
		
		i++;
	}
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(shrimpDefenderFont);
	var pointsString=concat(string_replace_all(string_format(pointsLerp, 6, 0), " ", "0"), "PTS"),
	p=6,
	pointsX=p-inv*80,
	pointsY=p;
	draw_text(pointsX, pointsY, pointsString);
	
	if showDeathMessage {
		var dx=GAME_WIDTH div 2,
		dy=GAME_HEIGHT div 2;
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text(dx, dy, "you died\n\npress any key to retry");
	}
	
	surface_reset_target();
	
	var sc=WINDOW_SCALE;
	draw_surface_ext(uiSurface, 0, 0, sc, sc, 0, c_white, 1);
	
	surface_set_target(uiSurface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
	
} else {
	uiSurface=surface_create(GAME_WIDTH, GAME_HEIGHT);
}