if live_call() return live_result;

if ds_exists(children, ds_type_list) {
	switch state {
		case 0:
			var l=.4;

			drawX=lerp(drawX, targetX, l);
			drawY=lerp(drawY, targetY, l);

			event_inherited();

			depth=-300;

			var yy=drawY,
			xx=drawX;

			for (var i=0; i<ds_list_size(children); i++) {
				if instance_exists(children[| i]) {
					with parentWindow {
						if ds_list_find_index(children, other.children[| i])<0 {
							ds_list_add(children, other.children[| i]);
							show_debug_message("added");
						}
					}
					with children[| i] {
						depth=other.depth-1;
						depth-=active*10;
			
						targetX=xx;
			
						if other.menuHorizontalAlignment==menuHAlign.left {
							targetX+=sprite_xoffset;
							targetX+=active*pushAmount;
						} else if other.menuHorizontalAlignment==menuHAlign.right {
							targetX-=sprite_xoffset;
							targetX-=active*pushAmount;
						}
			
						targetY=yy;
			
						if point_distance(targetX, targetY, drawX, drawY)>64 {
							drawX=targetX;
							drawY=targetY;
						}
			
						yy+=sprite_height;
					}
				} else {
					ds_list_delete(children, i);
				}
			}

			var in=input(mumbaInputWeaponDown, PRESS)-input(mumbaInputWeaponUp, PRESS),
			s=ds_list_size(children)-1;
			if in!=0 && !freezeSelection {
				if in>0 {
					playMumbaSound(sfxMumbaMenuDown);
				} else if in<0 {
					playMumbaSound(sfxMumbaMenuUp);
				}
				current+=in;
				if current<0 current=s;
				if current>s current=0;
				for (var i=0; i<=s; i++) {
					with children[| i] {
						active=false;
					}
				}
				with children[| current] {
					active=true;
				}
			}
		break;
	}
}