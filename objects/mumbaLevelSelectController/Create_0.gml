if live_call() return live_result;

event_inherited();

saveGame();

banner=instance_create_depth(0, 0, depth-20, mumbaLSBanner);
bannerLower=instance_create_depth(0, 0, depth-1000, mumbaLSBanner);
with bannerLower {
	sprite_index=sprLevelSelectBannerUpsideDown;
	xOffset=sprite_width/2;
}
mumba=instance_create_depth(0, 0, depth-500, mumbaLSMumba);
tiles=instance_create_depth(0, 0, depth-1, mumbaLSFloor);
shadows=instance_create_depth(0, 0, depth-10, mumbaLSShadowController);

children=ds_list_create();
ds_list_add(children, banner, tiles, shadows, mumba, bannerLower);

enum mumbaLevelData {name, sprite, normalLevelObject, hardLevelObject, endlessLevelObject, shopObject, dataString, timeTrialDataString, clearedHardModeDataString, eggathonDataString, perfectDataString, mapObject}
enum mumbaLevelState {hidden, unlocked, incomplete, complete}
addLevel=function(name, sprite, normalLevelObject=mumbaBeachLevel, hardLevelObject=mumbaBeachLevel, endlessLevelObject=mumbaBeachLevel, shopObject=mumbaShopEnterBeach, dataString="", timeTrialDataString="", hardModeDataString="", eggathonDataString="", noDamageDataString="") {
	/// @function addLevel(name, sprite, [normalLevelObject], [hardLevelObject], [endlessLevelObject], [shopObject], [dataString], [unlockedTimeTrialDataString], [clearedHardModeDataString], [eggathonDataString], [noDamageDataString])
	return [name, sprite, normalLevelObject, hardLevelObject, endlessLevelObject, shopObject, dataString, timeTrialDataString, hardModeDataString, eggathonDataString, noDamageDataString];
}

beachLevel=addLevel("Beginner Beach", sprLevelSelectPalmTree, mumbaBeachLevel, mumbaBeachLevelHard, mumbaBeachLevelEndless, mumbaShopEnterBeach, "beginnerBeachState", "beginnerBeachTimeTrial", "beginnerBeachClearedHardMode", "beginnerBeachEggathon", "beginnerBeachPerfect");
cityLevel=addLevel("Manic Metropolis", sprLevelSelectTower, mumbaCityLevel, mumbaCityLevelHard, mumbaCityLevelEndless, mumbaShopEnterCity, "manicMetropolisState", "manicMetropolisTimeTrial", "manicMetropolisClearedHardMode", "manicMetropolisEggathon", "manicMetropolisPerfect");
grassLevel=addLevel("Perilous Plain", sprLevelSelectFlower, mumbaPlainsLevel, mumbaPlainsLevelHard, mumbaPlainsLevelEndless, mumbaShopEnterPlains, "perilousPlainState", "perilousPlainTimeTrial", "perilousPlainClearedHardMode", "perilousPlainEggathon", "perilousPlainPerfect");
fireLevel=addLevel("Vicious Volcano", sprLevelSelectVolcano, mumbaVolcanoLevel, mumbaVolcanoLevelHard, mumbaVolcanoLevelEndless, mumbaShopEnterVolcano, "viciousVolcanoState", "viciousVolcanoTimeTrial", "viciousVolcanoClearedHardMode", "viciousVolcanoEggathon", "viciousVolcanoPerfect");
snowLevel=addLevel("Tense Tundra", sprLevelSelectSnowman, mumbaSnowLevel, mumbaSnowLevelHard, mumbaSnowLevelEndless, mumbaShopEnterSnow, "tenseTundraState", "tenseTundraTimeTrial", "tenseTundraClearedHardMode", "tenseTundraEggathon", "tenseTundraPerfect");
heavenLevel=addLevel("Hazardous Heaven", sprLevelSelectHeaven, mumbaHeavenLevel, mumbaHeavenLevelHard, mumbaHeavenLevelEndless, mumbaShopEnterHeaven, "hazardousHeavenState", "hazardousHeavenTimeTrial", "hazardousHeavenClearedHardMode", "hazardousHeavenEggathon", "hazardousHeavenPerfect");
tunnelLevel=addLevel("Turmoil Tunnels", sprLevelSelectRock, mumbaCaveLevel, mumbaCaveLevelHard, mumbaCaveLevelEndless, mumbaShopEnterCave, "turmoilTunnelsState", "turmoilTunnelsTimeTrial", "turmoilTunnelsClearedHardMode", "turmoilTunnelsEggathon", "turmoilTunnelsPerfect");

var bossStatus=loadData("bossState", mumbaLevelState.hidden);
bossLevel=addLevel(bossStatus>mumbaLevelState.incomplete ? "The Ugby Mumba" : "???", bossStatus>mumbaLevelState.incomplete ? sprLevelSelectSkull : sprLevelSelectMystery, mumbaBossLevel, noone, noone, noone, "bossState", "", "", "", "");
deadEstateLevel=addLevel("Dead Estate", sprLevelSelectDeadEstate, mumbaDeadEstateLevel, mumbaDeadEstateLevelHard, mumbaDeadEstateLevelEndless, mumbaShopEnterDeadEstate, "deadEstateState", "deadEstateTimeTrial", "deadEstateClearedHardMode", "deadEstateEggathon", "deadEstatePerfect");
shrimpLevel=addLevel("Shrimp Shramp", sprLevelSelectShrimp, mumbaShrimpLevel, mumbaShrimpLevelHard, mumbaShrimpLevelEndless, mumbaShopEnterShrimp, "shrimpState", "shrimpTimeTrial", "shrimpClearedHardMode", "shrimpEggathon", "shrimpPerfect");

levels=[
[beachLevel],
[cityLevel, grassLevel],
[fireLevel, snowLevel],
[heavenLevel, tunnelLevel],
[bossLevel],
[deadEstateLevel],
[shrimpLevel]
];

for (var i=0; i<array_length(levels); i++) {
	for (var z=0; z<array_length(levels[i]); z++) {
		levels[i][z][mumbaLevelData.mapObject]=instance_create_depth(0, 0, depth-50, mumbaLSLevelCoin);
		var d=noone;
		with levels[i][z][mumbaLevelData.mapObject] {
			normalLevelObject=other.levels[i][z][mumbaLevelData.normalLevelObject];
			hardLevelObject=other.levels[i][z][mumbaLevelData.hardLevelObject];
			endlessLevelObject=other.levels[i][z][mumbaLevelData.endlessLevelObject];
			shopObject=other.levels[i][z][mumbaLevelData.shopObject];
			name=other.levels[i][z][mumbaLevelData.name];
			decorSprite=other.levels[i][z][mumbaLevelData.sprite];
			dataString=other.levels[i][z][mumbaLevelData.dataString];
			
			timeTrialDataString=other.levels[i][z][mumbaLevelData.timeTrialDataString];
			clearedHardModeDataString=other.levels[i][z][mumbaLevelData.clearedHardModeDataString];
			eggathonDataString=other.levels[i][z][mumbaLevelData.eggathonDataString];
			perfectDataString=other.levels[i][z][mumbaLevelData.perfectDataString];
			
			timeTrialCleared=loadData(timeTrialDataString, false);
			hardModeCleared=loadData(clearedHardModeDataString, false);
			eggathonCleared=loadData(eggathonDataString, false);
			perfectCleared=loadData(perfectDataString, false);
			
			var m=mumbaLevelState.hidden;
			if dataString=="beginnerBeachState" {
				m=mumbaLevelState.incomplete;
			}
			status=loadData(dataString, m);
			if status==mumbaLevelState.unlocked {
				updateData(dataString, mumbaLevelState.incomplete);
			}
			owner=other;
			var spr=decorSprite;
			d=decor;
			with decor {
				sprite_index=spr;
			}
		}
		if instance_exists(d) {
			ds_list_add(children, d);
			show_debug_message("added decor");
		} else {
			show_debug_message("couldn't find decor");
		}
		
		ds_list_add(children, levels[i][z][mumbaLevelData.mapObject]);
	}
}

saveGame();

positionLevels=function() {
	/// @function positionLevels()
	var cx=100,
	cy=110,
	vo=64;
	for (var i=0; i<array_length(levels); i++) {
		var l=array_length(levels[i]),
		thisY=cy;
		thisY-=((l-1)/2)*vo;
		for (var z=0; z<l; z++) {
			with levels[i][z][mumbaLevelData.mapObject] {
				x=cx;
				y=thisY;
			}
			thisY+=vo;
		}
		cx+=128;
	}
}
positionLevels();

var gx=0, gy=0;

with mumbaPlayerData {
	other.currentLevelA=levelA;
	other.currentLevelB=levelB;
}

with levels[currentLevelA][currentLevelB][mumbaLevelData.mapObject] {
	active=true;
	gx=x;
	gy=y;
}

with mumba {
	gotoX=gx;
	gotoY=gy;
	x=gotoX;
	y=gotoY;
}

playMumbaMusic(bgmMumbaLevelSelect);

var arr=[],
s=array_length(levels)-1;
for (var i=s; i>=0; i--) {
	// give transfer array to current level objects
	for (var z=0; z<array_length(levels[i]); z++) {
		if levels[i][z][mumbaLevelState.unlocked]>=mumbaLevelState.complete {
			with levels[i][z][mumbaLevelData.mapObject] {
				nextCoins=arr;
			}
		}
	}
	
	// reset transfer array
	arr=[];
	
	// push current array's objects into transfer array
	for (var z=0; z<array_length(levels[i]); z++) {
		array_push(arr, levels[i][z][mumbaLevelData.mapObject]);
	}
	
	show_debug_message(concat("i ", i, ":"));
	for (var q=0; q<array_length(arr); q++) {
		show_debug_message(concat(arr[q]));
	}
	
	show_debug_message(concat("end;"));
}

allowMovement=true;

with mumbaLSLevelCoin {
	if status==mumbaLevelState.hidden {
		instance_destroy();
	} else if status==mumbaLevelState.unlocked {
		other.allowMovement=false;
	}
}

drawScript=function(x, y) {}