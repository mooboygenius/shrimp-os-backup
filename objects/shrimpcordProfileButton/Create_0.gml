if live_call() return live_result;

event_inherited();

substate=0;
coolColor=$996F68;
otherCoolColor=$B8A44F;
hoverEffect=0;
messenger=shrimpcordAutomessenger;
draw_set_font(fntShrimpcordUsername);

var w=sprite_width-32;
while string_width(name)>w {
	var l=string_length(name);
	name=string_delete(name, l, 1);
	show_debug_message("grrr");
}

drawScript=function(x, y) {
	/// @function drawScript(x, y)
	x+=round(hoverEffect*8);
	defaultDrawScript(x, y);
	var px=x-sprite_width/2+11,
	py=y+11-sprite_height/2;
	if sprite_exists(profilePicture) {
		draw_sprite_ext(profilePicture, 0, px, py, 1+squish, 1-squish, 0, c_white, 1);
	}
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	
	draw_set_font(fntShrimpcordUsername);
	var tx=px+12,
	ty=py-3;
	ty+=wave(-1, 1, .5)*hoverEffect;
	draw_text_transformed(tx, ty, name, 1+squish, 1-squish, 0);
	
	draw_set_font(fntSmaller);
	var dx=tx,
	dy=ty+8,
	c=image_index==1 ? otherCoolColor : coolColor;
	draw_text_transformed_color(dx, dy, description, 1+squish, 1-squish, 0, c, c, c, c, 1);
}

myMessageManager=noone;
messages=ds_list_create();
enum profileButtonStates {idle, selected}
clickFunction=function() {
	switch substate {
		// select this one
		case 0:
			with shrimpcordProfileButton {
				if substate==profileButtonStates.selected {
					clickFunction();
					squish=0;
				}
			}
			substate=profileButtonStates.selected;
			squish=.2;
			grace=2;
			myMessageManager=instance_create_depth(-999, -999, depth-1, shrimpcordMessageManager);
			with myMessageManager {
				owner=other;
				mood=other.mood;
				aggression=other.aggression;
				sensitivity=other.sensitivity;
				quirky=other.quirky;
				usesEmojis=other.usesEmojis;
				grammarCorrectness=other.grammarCorrectness;
				for (var i=0; i<ds_list_size(other.messages); i++) {
					var a=other.messages[| i];
					if is_array(a) {
						var name=a[0],
						text=a[1],
						pp=a[2],
						hour=a[3],
						minute=a[4];
						createMessage(name, text, pp, hour, minute, false);
					}
				}
			}
			with parentWindow {
				if !ds_list_find_index(children, other.myMessageManager) {
					ds_list_add(children, other.myMessageManager);
					show_debug_message("added a message manager to parent window's child objects");
				}
			}
		break;
		
		// deselect
		case 1:
			substate=profileButtonStates.idle;
			squish=-.2;
			image_index=0;
			instance_destroy(myMessageManager);
			show_debug_message("destroying message manager");
		break;
		
		
	}
}