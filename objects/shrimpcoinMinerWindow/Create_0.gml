if live_call() return live_result;

// Inherit the parent event
event_inherited();

var w=240,
h=160;
setWindowSize(self, x, y, w, h);
centerWindow(self);

greenColor=$5DD4C8;
darkGreenColor=$403528;

coinButton=instance_create_depth(-1000, -1000, depth-10, shrimpcoinButton);
ds_list_add(children, coinButton);

shrimpCoins=loadData("shrimpCoins", 0);
shrimpCoinsLerp=shrimpCoins;

textScale=1;

shopItems=ds_list_create();

minerSystem=part_system_create();
part_system_automatic_draw(minerSystem, false);

var wiggle=0;

minerPart=part_type_create();
part_type_sprite(minerPart, sprMinerShrimp, false, false, false);
part_type_scale(minerPart, -1, 1);
part_type_direction(minerPart, 180, 180, 0, 0);
part_type_speed(minerPart, .9, 1.2, 0, 0);
part_type_life(minerPart, 600, 600);
part_type_size(minerPart, .9, 1.1, 0, wiggle);

drillPart=part_type_create();
part_type_sprite(drillPart, sprMinerDrill, false, false, false);
part_type_scale(drillPart, -1, 1);
part_type_direction(drillPart, 180, 180, 0, 0);
part_type_speed(drillPart, .5, .7, 0, 0);
part_type_life(drillPart, 600, 600);
part_type_size(drillPart, 1, 1.1, 0, wiggle);

bombPart=part_type_create();
part_type_sprite(bombPart, sprMinerBomb, false, false, false);
part_type_scale(bombPart, -1, 1);
part_type_direction(bombPart, 180, 180, 0, 0);
part_type_speed(bombPart, .4, .7, 0, 0);
part_type_life(bombPart, 600, 600);
part_type_size(bombPart, 1, 1.1, 0, wiggle);

laserPart=part_type_create();
part_type_sprite(laserPart, sprMinerLaser, false, false, false);
part_type_scale(laserPart, -1, 1);
part_type_direction(laserPart, 180, 180, 0, 0);
part_type_speed(laserPart, .3, .5, 0, 0);
part_type_life(laserPart, 600, 600);
part_type_size(laserPart, 1, 1.1, 0, wiggle);

addShopItem=function(n, d, spr, p, cps, part, medal) {
	/// @function addShopItem(name, description, sprite, basePrice, coinsPerSecond, particle, medal)
	var map=ds_map_create();
	map[? "name"]=n;
	map[? "description"]=d;
	map[? "sprite"]=spr;
	map[? "basePrice"]=p;
	var o=instance_create_depth(-1000, -1000, depth-10, shrimpcoinItem);
	map[? "object"]=o;
	map[? "owned"]=loadData(n+"Owned", 0);
	map[? "coinsPerSecond"]=cps;
	map[? "particle"]=part;
	map[? "medal"]=medal;
	var in=ds_list_size(shopItems);
	with o {
		owned=map[? "owned"];
		name=n;
		desc=d;
		sprite=spr;
		price=p;
		basePrice=p;
		height=40;
		width=128;
		index=in;
	}
	ds_list_add(shopItems, map);
	ds_list_add(children, map[? "object"]);
	return map;
}

addShopItem("Shrimp Miners", "Crustacean laborers.", sprMinerShrimp, 50, 1, minerPart, "Crustacean Laborers");
addShopItem("Drills", "Pierce the heavens.", sprMinerDrill, 500, 5, drillPart, "Pierce the Heavens");
addShopItem("Cave Bombs", "Blast mining.", sprMinerBomb, 4000, 25, bombPart, "Blast Mining");
addShopItem("Mining Lasers", "Enormous-energy excavating.", sprMinerLaser, 15000, 100, laserPart, "Enormous-Energy Excavation");

coinUnlocks=[
	[false, 100, "One with Two Zeroes After It"],
	[false, 1000, "About 30 Cents IRL"],
	[false, 10000, "Good Luck Paying Rent"],
	[false, 100000, "I'm Running Out of Space to Put More Zeroes in the Medal Icon"],
	[false, 1000000, "Alright You Win"],
]