if live_call() return live_result;

event_inherited();

with keeper {
	xOffset=other.keeperXOffset
	yOffset=other.keeperYOffset;
}

var width=0, height=0;

for (var i=0; i<ds_list_size(children); i++) {
	with children[| i] {
		owner=other;
		state=other.state;
	}
	with parentWindow {
		width=portWidth;
		height=portHeight;
		if ds_list_find_index(children, other.children[| i])<0 {
			ds_list_insert(children, 0, other.children[| i]);
		}
	}
}

var in=input(mumbaInputWeaponDown, PRESS)-input(mumbaInputWeaponUp, PRESS),
size=ds_list_size(menuItems)-1,
previousSelection=currentSelection;

if in!=0 && !leaving {
	if in>0 {
		playMumbaSound(sfxMumbaMenuDown);
	} else {
		playMumbaSound(sfxMumbaMenuUp);
	}
	with keeper {
		sprite_index=other.normalSprite;
	}
	currentSelection+=in;
	if currentSelection<1 currentSelection=size else if currentSelection>size currentSelection=1;
}

var ty=50,
newText="",
detailerName="",
bigSpr=noone,
desc="";

for (var i=0; i<ds_list_size(menuItems); i++) {
	with menuItems[| i] {
		ty+=sprite_yoffset;
		var tx=width-sprite_xoffset-10;
		if other.currentSelection==i && i>0 && !other.leaving {
			active=true;
			tx-=8;
			if previousSelection!=other.currentSelection {
				newText=shopKeeperDescription;
				detailerName=longName;
				bigSpr=bigSprite;
				desc=description;
				if !stock newText=other.outOfStockText;
				squish=.2;
				grace=2;
			}
		} else {
			if active {
				squish=-.1;
				grace=1;
			}
			active=false;
		}
		targetX=tx;
		targetY=ty;
		ty+=sprite_yoffset;
	}
}

if newText!="" {
	setTextBubbleText(newText);
	with detailer {
		grace=1;
		name=detailerName;
		drawY-=6;
		yOffset=-3;
		sprite=bigSpr;
		description=desc;
	}
}

with moneyDisplay {
	var tx=width-sprite_xoffset-10;
	ty+=sprite_yoffset-1;
	targetX=tx;
	targetY=ty;
	var m=0;
	with mumbaPlayerData m=money;
	name=concat("  you have Ox", m);
	image_yscale=.6;
	textYOffset=0;
}

with mumbaShopItem {
	color=other.shopColor;
}

with transitionFrom {
	if circleSize>320 && circleChange>0 instance_destroy();
}

switch state {
	case 0:
		// idle
		if leaving {
			with keeper {
				sprite_index=other.greetingSprite;
			}
			state=1;
		}
	break;
	
	case 1:
		var mx=0;
		with mumber {
			mx=meX;
		}
		if leaving {
			with mumber {
				meX-=3;
				mx=meX;
			}
		}
		if mx<64 {
			state=2;
			transition=instance_create_depth(0, 0, 0, mumbaCircleTransition);
			var w=0, h=0;
			with parentWindow {
				ds_list_add(children, other.transition);
				w=portWidth;
				h=portHeight;
			}
			with transition {
				owner=other;
				circleSize=360;
				circleChange=-8;
				circleX=w/2;
				circleY=h/2;
			}
		}
	break;
		
	case 2:
		with mumber {
			meX-=3;
		}
		
		with transition {
			if circleSize<=0 {
				circleChange=8;
				other.state=3;
			}
		}
	break;
	
	case 3:
		var inst=instance_create_depth(0, 0, 0, exitScene);
		with inst {
			transitionFrom=other.transition;
		}
		if boughtSomething {
			with inst {
				cart=instance_create_depth(goalX, goalY, -50, mumbaShoppingCart);
				ds_list_insert(children, 0, cart);
			}
		}
		with parentWindow {
			ds_list_insert(children, 0, inst);
		}
		instance_destroy();
		state=4;
	break;
}