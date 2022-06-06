if live_call() return live_result;

children=ds_list_create();

event_inherited();

targetX=0;
targetY=0;

createMenuOption=function(str, c=WHITE_COLOR, oc=BLACK_COLOR, fnt=mumbaLevelFont, thickness=1, optionObject=mumbaTitleOption) {
	/// @function createMenuOption(string, [color], [outlineColor], [font], [thickness], [optionObject])
	var inst=instance_create_depth(0, 0, 0, optionObject);
	with inst {
		name=str;
		col=c;
		outlineCol=oc;
		thick=thickness;
		font=fnt;
		sprite_index=generateSprite(str, c, oc, fnt, thickness);
		owner=other;
	}
	ds_list_add(children, inst);
	show_debug_message(concat("options: ", ds_list_size(children)));
	return inst;
}

throwOptions=function() {
	/// @function throwOptions()
	state=2;
	for (var i=0; i<ds_list_size(children); i++) {
		with children[| i] {
			if active {
				verticalSpeed=-6;
				grace=10;
				active=false;
				squish=.2;
			} else {
				verticalSpeed=1;
			}
			timeChange=-1;
			weight=.4;
			horizontalSpeed=random_range(-1, 1);
		}
	}
}

drawScript=function(x, y) {}

enum menuHAlign {center, left, right}

menuHorizontalAlignment=menuHAlign.right;

current=-1;

state=0;