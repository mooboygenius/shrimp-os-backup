if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {}

gunInventory=ds_list_create();
var gi=loadData("mumbaGunInventory", 0);
if gi!=0 {
	ds_list_read(gunInventory, gi);
}

for (var i=0; i<ds_list_size(gunInventory); i++) {
	var n=gunInventory[| i];
	if !is_string(n) || !asset_get_index(n) {
		show_debug_message(concat("deleting [", i, "]:  ", n));
		ds_list_delete(gunInventory, i);
		i=-1;
	} else {
		show_debug_message(concat("[", i, "]:  ", n, " checks out"));
	}
}

if ds_list_size(gunInventory)<=0 {
	ds_list_add(gunInventory, "mumbaGun", "mumbaBazooka");
}



hatInventory=ds_list_create();
var hi=loadData("mumbaHatInventory", 0);
if hi!=0 {
	ds_list_read(hatInventory, hi);
}

for (var i=0; i<ds_list_size(hatInventory); i++) {
	var n=hatInventory[| i];
	if !is_string(n) || !asset_get_index(n) {
		show_debug_message(concat("deleting [", i, "]:  ", n));
		ds_list_delete(hatInventory, i);
		i=-1;
	} else {
		show_debug_message(concat("[", i, "]:  ", n, " checks out"));
	}
}

if ds_list_size(hatInventory)<=0 {
	ds_list_add(hatInventory, "mumbaNoHat");
}

currentGun=0;
currentHat=0;

money=loadData("mumbaMoney", 0);
show_debug_message(concat("loaded money as ", money));

levelA=loadData("mumbaLevelA", 0);
levelB=loadData("mumbaLevelB", 0);