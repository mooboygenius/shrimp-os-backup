if live_call() return live_result;

event_inherited();

setWindowSize(self, x, y, 218, 120);

games=ds_list_create();
addShteamGame=function(nm="default", spr=sprDefaultShteamThumbnail, l="") {
	/// @function addShteamGame([name], [sprite], [link])
	var inst=instance_create_depth(-100, -100, depth-10, shteamThumbnail);
	with inst {
		sprite_index=spr;
		name=nm;
		link=l;
		generateSprite();
	}
	ds_list_add(children, inst);
	ds_list_add(games, inst);
	return inst;
}

with addShteamGame("Ugby Mumba - DOWNLOADABLE", sprUgbyMumbaThumbnail, "") {
	sprite_index=sprUgbyMumbaThumbnail;
	generateSprite(sprShteamThumbnailDownloadableBanner, WHITE_COLOR);
	clickFunction=function() {
		squish=.8;
		createDownloadWindow(mumbaIcon, "Ugby Mumba");
	}
}
addShteamGame("Dead Estate", sprDeadEstateThumbnail, "https://store.steampowered.com/app/1484720/Dead_Estate/");
addShteamGame("Shoot Trip Die", sprShootTripDieThumbnail, "https://store.steampowered.com/app/1773060/Shoot_Trip_Die/");
addShteamGame("MAD SISTER'S....", sprMadSistersThumbnail, "https://www.newgrounds.com/portal/view/778644");
addShteamGame("Ugby Mumba 3", sprUgbyMumba3Thumbnail, "https://www.newgrounds.com/portal/view/778725");
addShteamGame("Shal's Game", sprShalsGameThumbnail, "https://www.newgrounds.com/portal/view/830496");
addShteamGame("EARTHDIEDSCRE....", sprEarthDiedScreamingThumbnail, "");

scrollY=0;
scrollYLerp=0;