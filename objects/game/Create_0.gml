if live_call() return live_result;

#macro DEV_MODE false
#macro dev:DEV_MODE true

#macro GAME_WIDTH 320
#macro GAME_HEIGHT 180
#macro GAME_RATIO GAME_WIDTH/GAME_HEIGHT
#macro WINDOW_SCALE 3
#macro WINDOW_WIDTH GAME_WIDTH*WINDOW_SCALE
#macro WINDOW_HEIGHT GAME_HEIGHT*WINDOW_SCALE
#macro BLACK_COLOR $211F1B
#macro WINDOW_COLOR $C2A7A3

view_camera[0]=camera_create_view(0, 0, GAME_WIDTH, GAME_HEIGHT);
view_enabled=true;
view_set_visible(0, true);
view_set_camera(0, view_camera[0]);
window_set_size(WINDOW_WIDTH, WINDOW_HEIGHT);
surface_resize(application_surface, GAME_WIDTH, GAME_HEIGHT);
display_set_gui_size(WINDOW_WIDTH, WINDOW_HEIGHT);

#macro START_ROOM rmBootup
#macro dev:START_ROOM rmTest
room_goto(START_ROOM);

globalvar previousMouseX, previousMouseY;
previousMouseX=getMouseX();
previousMouseY=getMouseY();

#macro MAXIMUM_WINDOWS 6

application_surface_draw_enable(false);

crtOn=false;

passSurf1=-1;
passSurf2=-1

globalvar gameFrame;
gameFrame=0;

randomize();

audio_group_load(bgm);
audio_group_load(sfx);
audio_group_load(mumbaBGM);
audio_group_load(mumbaSFX);

globalvar realWebsites;
realWebsites=ds_map_create();
createWebsite=function(name, object, description, tags="") {
	/// @function createWebsite(name, object, description, [tags])
	var map=ds_map_create();
	ds_map_add(map, "name", name);
	ds_map_add(map, "description", description);
	ds_map_add(map, "object", object);
	ds_map_add(map, "tags", tags);
	return map;
}
ds_map_add(realWebsites, "www.fireshrimp.shrimp", createWebsite("Fireshrimp", fireShrimpHome, "The homepage of Fireshrimp. A safe haven for the weary.", "shrimp home page start fire shrimp index guide fireshrimp"));
ds_map_add(realWebsites, "www.shrimple.shrimp", createWebsite("Shrimple", shrimple, "Search for pages across cyberspace!", "shrimp search index find look up library guide google"));
ds_map_add(realWebsites, "www.shteam.shrimp", createWebsite("Shteam", shteamWebsite, "Download and browse the largest collection of games across the Shrimpernet.", "games game video game play ugby mumba earth died screaming dead estate shoot trip die std steam videogame fun shteam entertain"));
ds_map_add(realWebsites, "www.shrimpgrounds.shrimp", createWebsite("Shrimpgrounds", shrimpgroundsHomePage, "Anything, by anyone.", "art music drawing painting audio content stuff fun newgrounds grounds entertain"));
ds_map_add(realWebsites, "www.paint.shrimp", createWebsite("Shrimp Paint", shrimpPaintDownloadPage, "Create your own art with Shrimp Paint!", "art drawing paint creation creative create make pixel artist painter"));
ds_map_add(realWebsites, "www.shrimposer.shrimp", createWebsite("Shrimposer", shrimposerDownloadPage, "Become the musician you've always wanted to be", "music make audio sound daw create creative compose composer"));
ds_map_add(realWebsites, "www.shrimpify.shrimp", createWebsite("Shrimpify", shrimpifyWebsite, "Your music, when you want it.", "music audio sound fun artist track song album entertain fun"));
ds_map_add(realWebsites, "www.shritter.shrimp", createWebsite("Shritter", shritterPage, "Tell everyone what's up!", "social media fun entertain write blog write content stuff"));
ds_map_add(realWebsites, "www.shrimpcord.shrimp", createWebsite("Shrimpcord", shrimpcordDownloadPage, "Chat with REAL shrimps", "social media fun entertain chat content cord"));
ds_map_add(realWebsites, "www.krillit.shrimp", createWebsite("Krillit", krillitFrontPage, "The worst page on the Shrimpernet", "social media fun entertain chat content stuff images pictures"));
ds_map_add(realWebsites, "www.4crustachan.shrimp", createWebsite("584953759834", crustachanWindow, "", ""));
ds_map_add(realWebsites, "www.prawncave.shrimp", createWebsite("98797896787", shrimpcoinMinerWebsite, "", ""));
ds_map_add(realWebsites, "www.helpgaming.shrimp", createWebsite("Help Gaming", helpGamingWebsite, "I just want to help people", "videos entertainment games gaming guide help"));
ds_map_add(realWebsites, "www.bimsymart.shrimp", createWebsite("Bimsymart Shrimp OS Edition!!", bimsymartWindow, "PLAY BIMSYMART SHRIMP OS EDITION NOW!!!", "fun games gaming entertainment video game play bimsy warioware funny cute"));
ds_map_add(realWebsites, "www.garyspage.shrimp", createWebsite("GARY'S PAGE", georgesWebsite, "DEDICATED TO THE LIVING SHITSTAIN MR. ZIEGLER", "blogs stuff weed fire blaze teacher ziegler gary george pages"));
ds_map_add(realWebsites, "www.farmworld.shrimp", createWebsite("Farmworld: Online Farm Image Resource", farmworldWebsite, "Best internet source for farm and farm-related images", "images farms barns grass earth pictures art resources entertainment animals cows chickens chicks tractors farming funny animal"));
ds_map_add(realWebsites, "www.strugglingturtle.shrimp", createWebsite("struggling_turtle", strugglingTurtlePage, "update this description later", "turtle struggling animal advice guide tips tricks help blog entertainment"));
zizousites();

globalvar masterVolume;
masterVolume=loadSetting("masterVolume", 1);

globalvar mumbaInputLeft, mumbaInputRight, mumbaInputJump, mumbaInputFire, mumbaInputWeaponUp, mumbaInputWeaponDown;
mumbaInputLeft=loadSetting("mumbaInputLeft", vk_left);
mumbaInputRight=loadSetting("mumbaInputRight", vk_right);
mumbaInputJump=loadSetting("mumbaInputJump", ord("Z"));
mumbaInputFire=loadSetting("mumbaInputFire", ord("X"));
mumbaInputWeaponUp=loadSetting("mumbaInputWeaponUp", vk_up);
mumbaInputWeaponDown=loadSetting("mumbaInputWeaponDown", vk_down);

globalvar sdInputLeft, sdInputRight, sdInputUp, sdInputDown, sdInputFire;
sdInputLeft=loadSetting("sdInputLeft", vk_left);
sdInputRight=loadSetting("sdInputRight", vk_right);
sdInputUp=loadSetting("sdInputUp", vk_up);
sdInputDown=loadSetting("sdInputDown", vk_down);
sdInputFire=loadSetting("sdInputFire", vk_space);

globalvar beenThroughIntro;
beenThroughIntro=loadData("beenThroughIntro", false);
show_debug_message(concat("beenThroughIntro ", beenThroughIntro));

globalvar mumbaShopFont, mumbaLevelFont, mumbaEggFont;
mumbaShopFont=font_add_sprite_ext(sprMumbaShopFont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890$*.!?-,'", true, 1);
mumbaLevelFont=font_add_sprite_ext(sprMumbaLevelFont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-.?!1234567890,'", true, 1);
mumbaEggFont=font_add_sprite_ext(sprMumbaEggFont, "1234567890/x", true, -1);

globalvar shrimpDefenderFont;
shrimpDefenderFont=font_add_sprite_ext(sprSDFont, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", true, -2);

#macro HIGHEST_INSTANCE_UNDER_MOUSE getHighestInstanceUnderMouse()

audioNames=-1;
for (var i=0; audio_exists(i); i++) {
	audioNames[i]=audio_get_name(i);
}
audioNameLength=array_length(audioNames);

audioBaseGains=setAudioBaseGains();

ng_connect("54499:9t2jINR8", "04g53mW64Tpe6MsiLKdsBQ==");
ng_initialize_medals_and_scoreboard();
ng_request_login();

applicationSurfaceX=0;
applicationSurfaceY=0;
applicationSurfaceShake=0;

waveTextureWidth=GAME_WIDTH;
waveTextureHeight=GAME_HEIGHT;
waveTextureWidthMultiplier=1;
waveTextureHeightMultiplier=1;
waveHorizontalIntensity=0;
waveVerticalIntensity=0;
waveTime=0;

cameraZoom=1;
cameraZoomLerp=cameraZoom;
cameraX=0;
cameraY=0;
cameraXLerp=0;
cameraYLerp=0;
cameraShake=0;

globalvar sdPartSystem;
sdPartSystem=part_system_create();
part_system_depth(sdPartSystem, -1000);

globalvar sdDamagePart;
sdDamagePart=part_type_create();
part_type_sprite(sdDamagePart, sprSDDamageEffect, true, true, false);
part_type_life(sdDamagePart, 10, 10);

adjustGains=function() {
	/// @function adjustGains()
	for (var i=0; i<audioNameLength; i++) {
		var n=audioNames[i],
		gain=audioBaseGains[i];
		if string_pos("sfxMumba", n) {
			var g=gain*mumbaMasterVolume*mumbaSoundVolume*soundVolume;
			audio_sound_gain(i, g, 0);
		} else if string_pos("bgmMumba", n) {
			var g=gain*mumbaMasterVolume*mumbaMusicVolume*musicVolume;
			audio_sound_gain(i, g, 0);
		} else if string_pos("sfx", n) {
			audio_sound_gain(i, gain*soundVolume, 0);
		} else if string_pos("bgm", n) {
			audio_sound_gain(i, gain*musicVolume, 0);
		}
	}
}

globalvar shownMumbaPrompt;
shownMumbaPrompt=false;