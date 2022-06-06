if live_call() return live_result;

playerIsAtFullHealth=true;

sprite=noone;

tileSurface=-1;
tileSurfaceWidth=0;
tileSurfaceHeight=0;

separationWidth=sprite_get_width(sprMumbaWall);
separationHeight=sprite_get_height(sprMumbaWall);
currentTiles=0;

generateLevelMapArray=function(arr) {
	/// @function generateLevelMapArray(arrayOfStrings)
	var xx=0,
	yy=0;
	for (var i=0; i<array_length(arr); i++) {
		var txt=arr[i];
		levelMap[currentTiles][yy]=[];
		for (var z=1; z<=string_length(txt); z++) {
			var char=string_char_at(txt, z);
			if string_length(char)>0 {
				levelMap[currentTiles][yy][xx]=char;
				xx++;
			}
		}
		xx=0;
		//show_debug_message(concat("parsed array ", yy));
		yy++;
	}
	
	// get longest array
	var l=0;
	for (var i=0; i<array_length(levelMap[currentTiles]); i++) {
		var pl=l;
		l=max(l, array_length(levelMap[currentTiles][i]));
		//if pl!=l show_debug_message(concat("new longest array is ", l));
	}
	
	//show_debug_message(concat("longest array is ", l));
	
	// size up all arrays to be that long
	for (var i=0; i<array_length(levelMap[currentTiles]); i++) {
		while (array_length(levelMap[currentTiles][i])<l) {
			levelMap[currentTiles][i][array_length(levelMap[currentTiles][i])]=0;
		}
		//show_debug_message(concat("resized array ", i, " to ", array_length(levelMap[currentTiles][i])));
	}
}

event_inherited();

children=ds_list_create();

levelInstances=ds_list_create();

unlockLevels=[];

generateMap=function() {
	/// @function generateMap()
	
	var height=array_length(levelMap[currentTiles])-1;
	for (var yy=0; yy<array_length(levelMap[currentTiles]); yy++) {
		var width=array_length(levelMap[currentTiles][yy])-1;
		for (var xx=0; xx<array_length(levelMap[currentTiles][yy]); xx++) {
			var a=levelMap[currentTiles][yy][xx],
			inst=noone,
			tx=xx*separationWidth,
			ty=yy*separationHeight;
			//show_debug_message(concat(xx, ", ", yy, ": ", a));
			
			if a=="S" {
				inst=instance_create_depth(tx, ty, -10, mumbaEnemySpawnPoint);
			} else if a=="R" {
				inst=instance_create_depth(tx, ty, -10, mumbaEnemyReturn);
			} else if a=="{" {
				inst=instance_create_depth(tx, ty, -10, mumbaBlueTeleportCrystal);
				with inst {
					x+=sprite_xoffset;
					y+=sprite_yoffset;
				}
			} else if a=="}" {
				inst=instance_create_depth(tx, ty, -10, mumbaRedTeleportCrystal);
				with inst {
					x+=sprite_xoffset;
					y+=sprite_yoffset;
				}
			} else if a=="&" {
				inst=instance_create_depth(tx, ty, -10, mumbaAngel);
			} else if a=="O" {
				inst=instance_create_depth(tx, ty, -10, mumbaGhost);
			} else if a=="@" {
				inst=instance_create_depth(tx, ty, -10, mumbaCrab);
			} else if a=="^" {
				inst=instance_create_depth(tx, ty, -10, mumbaTurtle);
			} else if a=="8" {
				inst=instance_create_depth(tx, ty, -10, mumbaSnowman);
			} else if a=="!" {
				inst=instance_create_depth(tx, ty, -10, mumbaSquirrel);
			} else if a=="&" {
				inst=instance_create_depth(tx, ty, -10, mumbaRat);
			} else if a=="T" {
				inst=instance_create_depth(tx, ty, -10, mumbaFungus);
			} else if a=="<" {
				inst=instance_create_depth(tx, ty, -10, mumbaShrimp);
			} else if a=="1" {
				var left=xx>0 && levelMap[currentTiles][yy][xx-1]==1,
				up=yy>0 && levelMap[currentTiles][yy-1][xx]==1,
				right=xx<width && levelMap[currentTiles][yy][xx+1]==1,
				down=yy<height && levelMap[currentTiles][yy+1][xx]==1;
				if !(left && up && right && down) {
					inst=instance_create_depth(tx, ty, -10, mumbaWall);
				}
			} else if a=="2" {
				if !instance_exists(mumbaPlayer) {
					player=instance_create_depth(tx, ty, -20, mumbaPlayer);
					inst=player;
				} else {
					show_debug_message(concat("A MUMBA ALREADY EXISTS????", instance_number(mumbaPlayer)));
				}
			} else if a=="$" {
				inst=instance_create_depth(tx, ty, -10, mumbaCoinSpawner);
			} else if a=="[" {
				inst=instance_create_depth(tx, ty, -10, mumbaSwapBlueBlock);
			} else if a=="]" {
				inst=instance_create_depth(tx, ty, -10, mumbaSwapRedBlock);
			} else if a=="/" {
				inst=instance_create_depth(tx, ty, other.depth-10, mumbaIceBlock);
			} else if a=="?" {
				inst=instance_create_depth(tx, ty, -10, mumbaFallingBlock);
			}
			
			if instance_exists(inst) {
				ds_list_insert(children, 0, inst);
				ds_list_insert(levelInstances, 0, inst);
			}
		}
	}
	
	tileMapHeight=array_length(levelMap[currentTiles]);
	tileMapWidth=array_length(levelMap[currentTiles][0]);
	tileSize=16;
	tileSurfaceWidth=max(tileSurfaceWidth, tileMapWidth*tileSize);
	tileSurfaceHeight=max(tileSurfaceHeight, tileMapHeight*tileSize);
	show_debug_message(concat("width: ", tileMapWidth, " * ", tileSize, " = ", tileSurfaceWidth, "\nheight: ", tileMapHeight, " * ", tileSize, " = ", tileSurfaceHeight));
	
	if !surface_exists(tileSurface) {
		tileSurface=surface_create(1600, 800);
		show_debug_message("made new tilesurface");
	}

	surface_set_target(tileSurface);
	
	var height=array_length(levelMap[currentTiles])-1;
	for (var yy=0; yy<array_length(levelMap[currentTiles]); yy++) {
		var width=array_length(levelMap[currentTiles][yy])-1;
		
		for (var xx=0; xx<array_length(levelMap[currentTiles][yy]); xx++) {
			if levelMap[currentTiles][yy][xx]==1 || levelMap[currentTiles][yy][xx]==9 {
				var in=14,
				left=xx>0 && (levelMap[currentTiles][yy][xx-1]==1 || levelMap[currentTiles][yy][xx-1]==9),
				up=yy>0 && (levelMap[currentTiles][yy-1][xx]==1 || levelMap[currentTiles][yy-1][xx]==9),
				right=xx<width && (levelMap[currentTiles][yy][xx+1]==1 || levelMap[currentTiles][yy][xx+1]==9),
				down=yy<height && (levelMap[currentTiles][yy+1][xx]==1 || levelMap[currentTiles][yy+1][xx]==9),
				leftUp=xx>0 && yy>0 && (levelMap[currentTiles][yy-1][xx-1]==1 || levelMap[currentTiles][yy-1][xx-1]==9),
				rightUp=xx<width && yy>0 && (levelMap[currentTiles][yy-1][xx+1]==1 || levelMap[currentTiles][yy-1][xx+1]==9),
				leftDown=xx>0 && yy<height && (levelMap[currentTiles][yy+1][xx-1]==1 || levelMap[currentTiles][yy+1][xx-1]==9),
				rightDown=xx<width && yy<height && (levelMap[currentTiles][yy+1][xx+1]==1 || levelMap[currentTiles][yy+1][xx+1]==9);
				
				#region hell on earth
				if !left && !up && right && down {
					if rightDown {
						in=1;
					} else {
						in=5;
					}
				} else if left && !up && right && down {
					if rightDown && leftDown {
						in=2;
					} else if !rightDown && leftDown {
						in=6;
					} else if rightDown && !leftDown {
						in=7;
					} else {
						in=9;
					}
				} else if left && !up && !right && down {
					if leftDown {
						in=3;
					} else {
						in=8;
					}
				} else if !left && !right {
					if !up && down {
						in=4;
					} else if up && down {
						in=16;
					} else if up && !down {
						in=28;
					} else if !up && !down {
						in=40;
					}
				} else if !left && up && right && down {
					if rightUp && rightDown {
						in=13;
					} else if !rightUp && rightDown {
						in=29;
					} else if rightUp && !rightDown {
						in=17;
					} else if !rightUp && !rightDown {
						in=53;
					}
				} else if left && up && right && down {
					if leftUp && leftDown && rightUp && rightDown {
						in=14;
					} else if !leftUp && leftDown && rightUp && rightDown {
						in=31;
					} else if leftUp && !leftDown && rightUp && rightDown {
						in=19;
					} else if leftUp && leftDown && !rightUp && rightDown {
						in=30;
					} else if leftUp && leftDown && rightUp && !rightDown {
						in=18;
					} else if !leftUp && !leftDown && rightUp && rightDown {
						in=55;
					} else if !leftUp && leftDown && !rightUp && rightDown {
						in=33;
					} else if !leftUp && leftDown && rightUp && !rightDown {
						in=22;
					} else if leftUp && !leftDown && !rightUp && rightDown {
						in=10;
					} else if leftUp && !leftDown && rightUp && !rightDown {
						in=21;
					} else if leftUp && leftDown && !rightUp && !rightDown {
						in=54;
					} else if !leftUp && !leftDown && !rightUp && rightDown {
						in=34;
					} else if leftUp && !leftDown && !rightUp && !rightDown {
						in=47;
					} else if !leftUp && leftDown && !rightUp && !rightDown {
						in=35;
					} else if !leftUp && !leftDown && rightUp && !rightDown {
						in=46;
					} else if !leftUp && !leftDown && !rightUp && !rightDown {
						in=57;
					}
				} else if left && up && !right && down {
					if leftUp && leftDown {
						in=15;
					} else if !leftUp && leftDown {
						in=32;
					} else if leftUp && !leftDown {
						in=20;
					} else if !leftUp && !leftDown {
						in=56;
					}
				} else if !left && up && right && !down {
					if !rightUp {
						in=25;
					} else {
						in=41;
					}
				} else if left && up && right && !down {
					if leftUp && rightUp {
						in=26;
					} else if !leftUp && rightUp {
						in=43;
					} else if leftUp && !rightUp {
						in=42;
					} else if !leftUp && !rightUp {
						in=45;
					}
				} else if left && up && !right && !down {
					if leftUp {
						in=27;
					} else {
						in=44;
					}
				} else if !up && !down {
					if !left && right {
						in=37;
					} else if left && right {
						in=38;
					} else if left && !right {
						in=39;
					}
				}
				#endregion
				
				draw_tile(tileSet, in, 0, xx*tileSize, yy*tileSize);
			}
		}
	}
	surface_reset_target();
	
	currentTiles++;
	
	sprite=sprite_create_from_surface(tileSurface, 0, 0, tileSurfaceWidth, tileSurfaceHeight, false, false, tileSurfaceWidth/2, tileSurfaceHeight/2);
	
	sprite_index=sprite;
}

generateLevelMapArray(["0"]);

generateMap();

drawScript=function(x, y) {
	if surface_exists(tileSurface) {
		draw_surface(tileSurface, x, y);
	} else {
		
	}
}
	
depth=-1000;

generateClouds=function(t, o) {
	/// @function generateClouds(time, object)
	if gameFrame%t==0 {
		var cloud=instance_create_depth(0, 0, 0, o);
		with cloud {
			drawY+=random_range(0+sprite_get_yoffset(object_get_sprite(o)), GAME_HEIGHT*.5);
			drawX=other.tileSurfaceWidth+sprite_get_xoffset(object_get_sprite(o))+random(64);
		}
		ds_list_add(children, cloud);
	}
}