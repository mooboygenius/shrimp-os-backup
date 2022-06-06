if live_call() return live_result;

event_inherited();

children=ds_list_create();
menuItems=ds_list_create();
background=instance_create_depth(0, 0, 100, mumbaBackground);
with background {
	sprite_index=other.backgroundSprite;
	loops=true;
}

drawScript=function() {}

banner=instance_create_depth(0, 0, -100, mumbaShopItem);
ds_list_add(menuItems, banner);
with banner {
	textYOffset=4;
	font=fntShrimppad;
	name=other.shopName;
	image_yscale=1.2;
}

moneyDisplay=instance_create_depth(0, 0, -100, mumbaShopItem);
with moneyDisplay {
	textYOffset=2;
	font=mumbaShopFont;
	font=fntSmaller;
	name="You have $0";
	image_yscale=.7;
}

keeperXOffset=0;
keeperYOffset=0;
bubbleXOffset=0;

keeper=instance_create_depth(0, 0, -100, mumbaShopkeeper);
with keeper {
	sprite_index=other.greetingSprite;
	previousSprite=sprite_index;
}
mumber=instance_create_depth(0, 0, -110, mumbaInShop);
textBubble=instance_create_depth(0, 0, -50, mumbaShopTextBubble);
detailer=instance_create_depth(0, 0, -200, mumbaShopItemDetails);

setTextBubbleText=function(str) {
	/// @function setTextBubbleText(str)
	with textBubble {
		text=parseText(str);
		written="";
		copy=0;
		writtenAmount=0;
	}
}

generateShopList=function() {
	/// @function generateShopList([str1], [str2], [str3]...)
	for (var i=0; i<argument_count; i++) {
		var n=argument[i];
		if getMumbaItemMap(n) {
			var inst=instance_create_depth(-100, -100, -100, mumbaShopItem);
			with inst {
				name=getMumbaItemShortName(n);
				longName=n;
				price=getMumbaItemPrice(n);
				sprite=getMumbaItemSmallSprite(n);
				bigSprite=getMumbaItemBigSprite(n);
				description=getMumbaItemDescription(n);
				shopKeeperDescription=getMumbaItemShopKeeperDescription(n);
				color=other.shopColor;
				var alreadyBought=false;
				var object=getMumbaItemObject(n);
				with mumbaPlayerData {
					if ds_list_find_index(gunInventory, object)>=0 || ds_list_find_index(hatInventory, object)>=0 {
						alreadyBought=true;
					}
				}
				if alreadyBought {
					stock=0;
					color=outOfStockColor;
				}
				var ass=asset_get_index(object);
				if ass {
					if object_is_ancestor(ass, mumbaGun) {
						buyScript=function() {
							buyWeapon(self.longName);
						}
					} else if object_is_ancestor(ass, mumbaHat) {
						buyScript=function() {
							buyHat(self.longName);
						}
					}
				}
				buyText=other.buyText;
				cantBuyText=other.shortText;
				outOfStockText=other.outOfStockTryToBuyText;
			}
			ds_list_add(children, inst);
			ds_list_add(menuItems, inst);
		} else {
			show_debug_message(concat(argument[i], " is not a real item"));
		}
	}
	
	var inst=instance_create_depth(-100, -100, -100, mumbaShopItem);
	with inst {
		name="Leave shop";
		price=0;
		sprite=noone;
		shopKeeperDescription=other.aboutToLeaveText;
		stock=999;
		buyText=other.leaveText;
		buyScript=function() {
			show_debug_message("leaving...");
			leaveShop();
		}
	}
	ds_list_add(children, inst);
	ds_list_add(menuItems, inst);
}

setTextBubbleText(greetingText);

ds_list_add(children, background, keeper, mumber, textBubble, banner, moneyDisplay, detailer);

state=0;

currentSelection=0;

transitionFrom=noone;

timer=0;

transition=noone;

with mumbaShopItem {
	color=other.shopColor;
}

with mumbaPlayerData{ 
	var a=[mumbaMagicStaff, mumbaBazooka, mumbaMushroom, mumbaPeter, mumbaSnowmanHead, mumbaIceAxe, mumbaBoomerang, mumbaFlower, mumbaMagicHarp, mumbaHolyBow, mumbaPitchfork, mumbaFlameThrower, mumbaFryCrossbow, mumbaBurgerCannon, mumbaTikiGun, mumbaCoconutShotgun],
	unlock=true;
	for (var i=0; i<array_length(a); i++) {
		if ds_list_find_index(gunInventory, a[i])<0 {
			unlock=false;
			break;
		}
	}
	if unlock {
		unlockMedal("Gun Nut");
	}
	
	var a=[mumbaShrimpHat, mumbaTruckerHat, mumbaFunnyGlasses, mumbaWitchHat, mumbaBlockHead, mumbaScarf, mumbaRaccoonCap, mumbaHalo, mumbaDevilHorns, mumbaCheeseHead, mumbaStrawHat],
	unlock=true;
	for (var i=0; i<array_length(a); i++) {
		if ds_list_find_index(hatInventory, a[i])<0 {
			unlock=false;
			break;
		}
	}
	if unlock {
		unlockMedal("Hat Fancier");
	}
}