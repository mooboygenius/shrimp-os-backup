if live_call() return live_result;

event_inherited();

addChildrenToParentWindow(children);

var fallerY=GAME_HEIGHT div 2+wave(-1, .5, 4)*16,
fallerX=2/3*GAME_WIDTH+wave(-64, 0, 5);

switch state {
	case 0:
		timer++;
		if timer>15 {
			timer=0;
			state=1;
			playMumbaMusic(bgmMumbaModeSelect);
		}
	break;
	
	case 1:
		var py=-999;
		with parentWindow {
			childrenSurfaceY=lerp(childrenSurfaceY, 0, .1);
			py=childrenSurfaceY;
		}
		if py>=-1 {
			with parentWindow {
				childrenSurfaceY=0;
			}
			timer=0;
			state=2;
		}
	break;
	
	case 2:
		timer++;
		if timer>15 {
			name=instance_create_depth(0, 0, -20, mumbaModeSelectLevelName);
			ds_list_add(children, name);
			with name {
				sprite_index=generateSprite(other.levelName);
				drawY=-GAME_HEIGHT/2;
			}
			
			timer=0;
			state=3;
			
			menu=instance_create_depth(0, 0, -100, mumbaModeMenu);
			with menu {
				menuHorizontalAlignment=menuHAlign.left;
				targetX=16;
				targetY=60;
				drawX=targetX;
				drawY=-GAME_HEIGHT*4;
				var fnt=fntMumbaShop,
				beaten=loadData(other.levelDataString, mumbaLevelState.incomplete)>=mumbaLevelState.complete;
				if other.normalLevelObject {
					with createMenuOption(beaten ? "NORMAL LEVEL" : "PLAY LEVEL", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitlePressableOption) {
						pressScript=function() {
							with mumbaModeSelect {
								state=4;
								gotoObject=normalLevelObject;
							}
							with owner {
								throwOptions();
							}
						}
					}
				}
				
				if beaten {
					if other.hardLevelObject {
						with createMenuOption("HARD LEVEL", $7752FF, BLACK_COLOR, fnt, 1, mumbaTitlePressableOption) {
							pressScript=function() {
								with mumbaModeSelect {
									state=4;
									gotoObject=hardLevelObject;
								}
								with owner {
									throwOptions();
								}
							}
						}
					}
					
					if other.endlessLevelObject {
						with createMenuOption("ENDLESS LEVEL", $C2A7A3, BLACK_COLOR, fnt, 1, mumbaTitlePressableOption) {
							pressScript=function() {
								with mumbaModeSelect {
									state=4;
									gotoObject=endlessLevelObject;
								}
								with owner {
									throwOptions();
								}
							}
						}
					}
					
					if other.shopObject {
						with createMenuOption("SHOP", $83EEFF, BLACK_COLOR, fnt, 1, mumbaTitlePressableOption) {
							pressScript=function() {
								with mumbaModeSelect {
									state=4;
									gotoObject=shopObject;
								}
								with owner {
									throwOptions();
								}
							}
						}
					}
				} else {
					targetY+=24;
				}
				
				with createMenuOption("BACK", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitlePressableOption) {
					pressScript=function() {
						with mumbaModeSelect {
							state=4;
							gotoObject=mumbaLevelSelectController;
						}
						with owner {
							throwOptions();
						}
					}
				}
			}
			ds_list_add(children, menu);
		}
	break;
	
	case 3:
		timer=0;
		with mumba {
			y=lerp(y, fallerY, .1);
			x=lerp(x, fallerX, .6);
			angle+=3;
		}
	break;
	
	case 4:
		with mumba {
			angle+=4;
			verticalSpeed+=.5;
			y+=verticalSpeed;
		}
		
		with name {
			verticalSpeed+=1.5;
		}
		
		timer++;
		if timer>60 {
			with parentWindow {
				var t=-GAME_HEIGHT;
				childrenSurfaceY=lerp(childrenSurfaceY, t, .1);
			}
			if timer>90 {
				timer=0;
				state=5;
				
				stopMumbaMusic();
				
				var inst=instance_create_depth(0, 0, depth, mumbaLSLevelLoader);
				with inst {
					owner=other;
					levelObject=other.gotoObject;
				}
				
				with parentWindow {
					ds_list_insert(children, 0, inst);
				}
			}
		}
	break;
	
	case 5:
	break;
}

with back {
	verticalSpeed=lerp(verticalSpeed, wave(-4, -6, 5), .1);
	horizontalSpeed=lerp(horizontalSpeed, wave(-1, 1, 2)*.1, .1);
}

with parentWindow {
	cameraX=0;
	cameraY=0;
}

with name {
	drawX=sprite_xoffset+12;
	drawY=lerp(drawY, sprite_yoffset+10, .2);
}

drawScript=function() {
	var sx=3/4*GAME_WIDTH+12,
	sy=2/5*GAME_HEIGHT,
	dx=sx,
	dy=sy+wave(-1, 1, 1),
	p=40,
	n=0,
	beaten=loadData(levelDataString, mumbaLevelState.incomplete)>=mumbaLevelState.complete;
	if beaten {
		if perfectDataString!="" {
			draw_sprite(sprMumbaHealthMedal, !perfectCleared, dx, dy);
			dx+=p;
			n++;
		}
		if timeTrialDataString!="" {
			draw_sprite(sprMumbaTimeMedal, !timeTrialCleared, dx, dy);
			dx+=p;
			n++;
		}
		dx=sx;
		dy+=p;
		if eggathonDataString!="" {
			draw_sprite(sprMumbaEggsMedal, !eggathonCleared, dx, dy);
			dx+=p;
			n++;
		}
		if clearedHardModeDataString!="" {
			draw_sprite(sprMumbaHardModeMedal, !hardModeCleared, dx, dy);
			dx+=p;
			n++;
		}
	}
	//draw_sprite(sprMumbaTimeMedal, timeTrialCleared, dx, dy);
}

depth=-100;