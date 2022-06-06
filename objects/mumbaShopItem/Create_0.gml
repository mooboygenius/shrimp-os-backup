if live_call() return live_result;

#macro WHITE_COLOR $E8FFF5

event_inherited();

active=false;

defaultColor=$B8A44F;

itemXScale=1;

textYOffset=0;

buyText="";
cantBuyText="";
outOfStockText="";

buyWeapon=function(name) {
	/// @function buyWeapon(name)
	var obj=getMumbaItemObject(name);
	with mumbaShopController {
		boughtSomething=true;
	}
	with mumbaPlayerData {
		if obj!="" { 
			ds_list_add(gunInventory, obj);
			updateData("mumbaGunInventory", ds_list_write(gunInventory));
			var a=["mumbaMagicStaff", "mumbaBazooka", "mumbaMushroom", "mumbaPeter", "mumbaSnowmanHead", "mumbaIceAxe", "mumbaBoomerang", "mumbaFlower", "mumbaMagicHarp", "mumbaHolyBow", "mumbaPitchfork", "mumbaFlameThrower", "mumbaFryCrossbow", "mumbaBurgerCannon", "mumbaTikiGun", "mumbaCoconutShotgun"],
			unlock=true;
			for (var i=0; i<array_length(a); i++) {
				if ds_list_find_index(gunInventory, a[i])<0 {
					unlock=false;
					break;
				}
			}
			
			if !shownMumbaPrompt {
				shownMumbaPrompt=true;
				with createShrimpy(concat("To switch weapons, use [", getStringFromInput(mumbaInputWeaponUp), "] and [", getStringFromInput(mumbaInputWeaponDown), "].\n\nTo equip hats, do the same thing while holding [SHIFT].")) {
					destroyScript=function() {
						/// @function destroyScript()
						timer++;
						if timer>600 {
							state=1;
						}
					}
				}
			}
			
			if unlock {
				unlockMedal("Gun Nut");
			}
		}
	}
}

buyHat=function(name) {
	/// @function buyHat(name)
	var obj=getMumbaItemObject(name);
	with mumbaShopController {
		boughtSomething=true;
	}
	with mumbaPlayerData {
		if obj!="" {
			ds_list_add(hatInventory, obj);
			updateData("mumbaHatInventory", ds_list_write(hatInventory));
			var a=["mumbaShrimpHat", "mumbaTruckerHat", "mumbaFunnyGlasses", "mumbaWitchHat", "mumbaBlockHead", "mumbaScarf", "mumbaRaccoonCap", "mumbaHalo", "mumbaDevilHorns", "mumbaCheeseHead", "mumbaStrawHat"],
			unlock=true;
			for (var i=0; i<array_length(a); i++) {
				if ds_list_find_index(hatInventory, a[i])<0 {
					unlock=false;
					break;
				}
			}
			
			if !shownMumbaPrompt {
				shownMumbaPrompt=true;
				with createShrimpy(concat("To switch weapons, use [", getStringFromInput(mumbaInputWeaponUp), "] and [", getStringFromInput(mumbaInputWeaponDown), "].\n\nTo equip hats, do the same thing while holding [SHIFT].")) {
					destroyScript=function() {
						/// @function destroyScript()
						timer++;
						if timer>600 {
							state=1;
						}
					}
				}
			}
			
			if unlock {
				unlockMedal("Hat Fancier");
			}
		}
	}
}

leaveShop=function() {
	/// @function leaveShop()
	with mumbaShopController {
		leaving=true;
	}
}

buyScript=function() {
	/// @function buyScript()
}