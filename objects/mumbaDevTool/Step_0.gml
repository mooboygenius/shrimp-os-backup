if live_call() return live_result;

event_inherited();

audio_group_stop_all(bgm);

xstart=0;
ystart=0;

drawScript=function(x, y) {
	draw_clear_alpha(BLACK_COLOR, 1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntSystem);
	draw_set_color(c_white);
	draw_text(4, 4, concat("mumba dev tool\n",
	"1 to start from title screen\n",
	"2 to start from level select\n",
	"3 to start from <", object_get_name(startObjects[current]), ">"));
}

if input(ord("1"), PRESS) {
	var inst=instance_create_depth(0, 0, 0, mumbaTitleController);
	with parentWindow {
		ds_list_add(children, inst);
	}
	instance_destroy();
}

if input(ord("2"), PRESS) {
	var inst=instance_create_depth(0, 0, 0, mumbaLevelSelectController);
	with parentWindow {
		ds_list_add(children, inst);
	}
	instance_destroy();
}

if input(ord("3"), PRESS) {
	var inst=instance_create_depth(0, 0, 0, startObjects[current]);
	with parentWindow {
		ds_list_add(children, inst);
	}
	instance_destroy();
}

var in=input(vk_right, PRESS)-input(vk_left, PRESS);
if in!=0 {
	current+=in;
	var s=array_length(startObjects)-1;
	if current<0 current=s;
	if current>s current=0;
}