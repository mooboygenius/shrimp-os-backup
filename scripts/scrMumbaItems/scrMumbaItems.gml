globalvar mumbaItems;
mumbaItems=ds_map_create();

function createMumbaItem(nm, ass, desc, skdesc, smallspr, bigspr, price, shortName="") {
	/// @function createMumbaItem(name, associatedObject, description, shopKeeperDescription, smallSprite, bigSprite, price, [shortName])
	if shortName=="" shortName=nm;
	ds_map_add(mumbaItems, nm, ds_map_create());
	var map=mumbaItems[? nm];
	ds_map_add(map, "name", nm);
	ds_map_add(map, "object", ass);
	ds_map_add(map, "description", desc);
	ds_map_add(map, "shopKeeperDescription", skdesc);
	ds_map_add(map, "smallSprite", smallspr);
	ds_map_add(map, "bigSprite", bigspr);
	ds_map_add(map, "price", price);
	ds_map_add(map, "shortName", shortName);
}

function getMumbaItemMap(name) {
	if ds_map_exists(mumbaItems, name) {
		return mumbaItems[? name];
	}
	return noone;
}

function getMumbaItemObject(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "object"];
}

function getMumbaItemDescription(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "description"];
}

function getMumbaItemShopKeeperDescription(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "shopKeeperDescription"];
}

function getMumbaItemSmallSprite(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "smallSprite"];
}

function getMumbaItemBigSprite(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "bigSprite"];
}

function getMumbaItemPrice(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "price"];
}

function getMumbaItemShortName(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "shortName"];
}

createMumbaItem("Gun", mumbaGun, "Mumba's iconic gun!", "Looks sexy.", sprMumbaGun, sprMumbaGunUI, 0);

createMumbaItem("Coconut Shotgun", "mumbaCoconutShotgun", "Fires bouncy coconuts!", "Ooh -- the Coconut Shotgun! Do you like it?", sprMumbaCoconutShotgun, sprMumbaCoconutShotgunUI, 20, "Coco. S.Gun");
createMumbaItem("Tiki Gun", "mumbaTikiGun", "High fire rate!", "The world-famous Tiki Gun! I carved it myself, you know.", sprMumbaTikiGun, sprMumbaTikiGunUI, 20);
createMumbaItem("Straw Hat", "mumbaStrawHat", "Relax a little!", "Wear this to unwind instantly!", sprMumbaStrawHat, sprMumbaUIStrawHat, 40);

createMumbaItem("Burger Cannon", "mumbaBurgerCannon", "Shoots heavy burger projectiles!", "Ugh... Do you REALLY want THAT?...", sprMumbaBurgerCannon, sprMumbaBurgerCannonUI, 30, "Burg Cannon");
createMumbaItem("Fry Crossbow", "mumbaFryCrossbow", "Fires penetrating fry arrows!", "Are you gonna order something -- like -- edible?...", sprMumbaFryCrossbow, sprMumbaFryCrossbowUI, 30, "Fry C.Bow");
createMumbaItem("Cheese Head", "mumbaCheeseHead", "We ball.", "You've GOT to be kidding me...", sprMumbaCheeseHead, sprMumbaUICheeseHead, 40);

createMumbaItem("Flamethrower", "mumbaFlameThrower", "Blasts clouds of fire at enemies!", "Too hot to handle for ya?", sprMumbaFlameThrower, sprMumbaFlameThrowerUI, 40);
createMumbaItem("Devil's Pitchfork", "mumbaPitchfork", "Quickly stabs at a close range!", "Don't point that thing at me!", sprMumbaPitchfork, sprMumbaPitchforkUI, 40, "Devil P.Fork");
createMumbaItem("Demon Horns", "mumbaDevilHorns", "Scary!", "Those look so cute on you!", sprMumbaDevilHorns, sprMumbaUIDevilHorns, 40);

createMumbaItem("Holy Bow", "mumbaHolyBow", "Fires three arrows at once!", "Be careful where you point that thing, little dude.", sprMumbaHolyBow, sprMumbaHolyBowUI, 50);
createMumbaItem("Magic Harp", "mumbaMagicHarp", "Shoots music notes in all directions!", "Good luck playing this without any fingers.", sprMumbaMagicHarp, sprMumbaMagicHarpUI, 50);
createMumbaItem("Angelic Halo", "mumbaHalo", "A heavenly glow upon you.", "Hey, don't steal my look!", sprMumbaHalo, sprMumbaUIHalo, 40, "A. Halo");

createMumbaItem("Flower", "mumbaFlower", "Fires a barrage of low-damage seeds!", "Large spread. Best used in close-combat.", sprMumbaFlower, sprMumbaFlowerUI, 30);
createMumbaItem("Boomerang", "mumbaBoomerang", "What goes around comes around!", "Classic Australian armament.", sprMumbaBoomerang, sprMumbaBoomerangUI, 30);
createMumbaItem("Raccoon Cap", "mumbaRaccoonCap", "Adorable!", "Fuzzy. Charming. A wise purchase.", sprMumbaRaccoonHat, sprMumbaUIRaccoonHat, 40, "Rac. Cap");

createMumbaItem("Ice Axe", "mumbaIceAxe", "Swings at enemies with a heavy force!", "Oh... You want t-that old t-thing?...", sprMumbaIceAxe, sprMumbaIceAxeUI, 40);
createMumbaItem("Snowman's Head", "mumbaSnowmanHead", "Vomits snowballs everywhere!", "H-He's cute once you g-get past the puking...", sprMumbaSnowman, sprMumbaSnowmanUI, 40, "S.Man Head");
createMumbaItem("Scarf", "mumbaScarf", "Hand-stitched with love.", "That'll k-keep you warm!", sprMumbaScarf, sprMumbaUIScarf, 40);

createMumbaItem("Peter the Ant", "mumbaPeter", "Peter the Ant!", "eEeEeEwWWWWWWW STUPID ANT.", sprMumbaPeter, sprMumbaPeterUI, 50, "Peter");
createMumbaItem("The Fungus", "mumbaMushroom", "A fungus among us.", "eAt It!!!!NOW", sprMumbaMushroom, sprMumbaMushroomUI, 50, "Fungus");
createMumbaItem("Mumbacraft Head", "mumbaBlockHead", "You blockhead!", "wOw YoU lOoK sO cUbIc!!", sprMumbaBlockHead, sprMumbaUIBlockHead, 40, "M.Craft Head");

createMumbaItem("Sorcery Staff", "mumbaMagicStaff", "Shoots magic projectiles!", "Now you just need one of these hats to go with it, heheh!", sprMumbaMagicStaff, sprMumbaMagicStaffUI, 50, "S. Staff");
createMumbaItem("Bazooka", "mumbaBazooka", "Fires big explosive rockets!", "Just don't go pointing that where it doesn't belong, m'kay?", sprMumbaBazooka, sprMumbaBazookaUI, 50, "Bazooka");
createMumbaItem("Witch's Hat", "mumbaWitchHat", "Wicked!", "Looks pretty dang good, I'd say!", sprMumbaWitchHat, sprMumbaUIWitchHat, 40, "W. Hat");

createMumbaItem("Shrimp Hat", "mumbaShrimpHat", "Live out your shrimpiest dreams!", "WOW THAT LOOKS SO SEXY ON YOU...", sprMumbaShrimpHat, sprMumbaUIShrimpHat, 40);
createMumbaItem("Trucker Hat", "mumbaTruckerHat", "You're excellent!", "YOU LOOK REALLY STUPID WITH THAT ON!", sprMumbaTruckerHat, sprMumbaUITruckerHat, 40);
createMumbaItem("Silly Glasses", "mumbaFunnyGlasses", "The perfect disguise!", "I CAN'T EVEN RECOGNIZE YOU WOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOW", sprMumbaFunnyMustache, sprMumbaUIFunnyMustache, 40);