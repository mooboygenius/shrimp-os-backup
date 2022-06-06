if live_call() return live_result;
state=0;
var n=loadData("desktopBackground", choose("sprDesktopBackground1", "sprDesktopBackground4", "sprDesktopBackground3"));
if asset_get_index(n) {
	sprite_index=asset_get_index(n);
}
lastSprite=sprite_index;
swap=0;