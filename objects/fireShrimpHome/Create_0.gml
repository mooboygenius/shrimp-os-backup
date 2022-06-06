if live_call() return live_result;

event_inherited();

font=fntSmaller;
links=ds_list_create();
var addWebsite=function(url) {
	/// @function addWebsite(url)
	var inst=instance_create_depth(-100, -100, depth-1, textLink);
	with inst {
		font=other.font;
		text=url;
	}
	ds_list_add(links, inst);
	ds_list_add(children, inst);
}
addWebsite("Shteam");
addWebsite("Shrimple");
addWebsite("Shrimpgrounds");
addWebsite("Shritter");
addWebsite("Krillit");