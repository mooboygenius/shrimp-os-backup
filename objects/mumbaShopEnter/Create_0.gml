if live_call() return live_result;

event_inherited();

state=0;
timer=0;

doStateMachine=function() {
	/// @function doStateMachine()
	
	switch state {
		case 0:
			if !audio_is_playing(bgmMumbaShopIntro) playMumbaMusic(bgmMumbaShopIntro, false);
			timer++;
			if timer>60 {
				timer=0;
				state=1;
				
				with myPlayer {
					horizontalSpeed=2.2;
				}
			}
		break;
		
		case 1:
			if !audio_is_playing(bgmMumbaShopIntro) && !audio_is_playing(bgmMumbaShop) playMumbaMusic(bgmMumbaShop);
			with myPlayer {
				if x>(other.goalX-128) {
					verticalSpeed=-3;
					other.state=2;
				}
			}
		break;
		
		case 2:
			if !audio_is_playing(bgmMumbaShopIntro) && !audio_is_playing(bgmMumbaShop) playMumbaMusic(bgmMumbaShop);
			timer++;
			if timer>120 {
				show_debug_message("what the fuck");
				transition=instance_create_depth(0, 0, 0, mumbaCircleTransition);
				with parentWindow {
					ds_list_add(children, other.transition);
				}
				with transition {
					circleSize=360;
					circleChange=-8;
					show_debug_message("grrrr");
				}
				timer=0;
				state=3;
			}
		break;
		
		case 3:
			if !audio_is_playing(bgmMumbaShopIntro) && !audio_is_playing(bgmMumbaShop) playMumbaMusic(bgmMumbaShop);
			with transition {
				if circleSize<=0 {
					other.state=4;
				}
			}
		break;
		
		case 4:
			if !audio_is_playing(bgmMumbaShopIntro) && !audio_is_playing(bgmMumbaShop) playMumbaMusic(bgmMumbaShop);
			timer++;
			if timer>30 {
				timer=0;
				var inst=instance_create_depth(0, 0, 0, myShop);
				for (var i=0; i<ds_list_size(children); i++) {
					with children[| i] instance_destroy();
				}
				
				ds_list_destroy(children);
				
				instance_destroy();
				
				var w=1, h=1;
				with parentWindow {
					ds_list_insert(children, 0, inst);
					w=portWidth div 2;
					h=portHeight div 2;
				}
				
				with transition {
					circleSize=0;
					circleChange*=-1;
					circleX=w;
					circleY=h;
				}
				
				with inst {
					transitionFrom=other.transition;
				}
			}
		break;
	}
}

levelMap=-1;

generateLevelMapArray([
"2",
"",
"",
"",
"",
"",
"",
"",
"11111111111111111111111",
"11111111111111111111111",
"11111111111111111111111",
"11111111111111111111111",
"11111111111111111111111"
]);

generateMap();

building=instance_create_depth(0, 0, 0, shopBuilding);
with building {
	sprite_index=other.buildingSprite;
}
backBuilding=noone;
var obj=shopBuildingFront;
with building {
	obj=frontSection;
}
frontBuilding=instance_create_depth(0, 0, 0, obj);
with frontBuilding {
	sprite_index=other.buildingSpriteFront;
}
ds_list_add(children, building);
ds_list_add(levelInstances, building);
ds_list_add(children, frontBuilding);
ds_list_add(levelInstances, frontBuilding);

myPlayer=noone;
for (var i=0; i<ds_list_size(levelInstances); i++) {
	if levelInstances[| i].object_index==mumbaPlayer {
		myPlayer=levelInstances[| i];
		repeat(20) show_debug_message("found player!");
	}
}

with myPlayer {
	while !place_meeting(x, y+1, mumbaWall) y++;
	showUI=false;
	canControl=false;
	wrapAroundScreen=false;
}

transition=noone;

with building {
	x=360-sprite_xoffset;
	y=128-sprite_yoffset;
	other.goalX=x+other.goalXOffset;
	other.goalY=y+other.goalYOffset;
}