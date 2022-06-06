#macro SETTINGS_FILE "settings.sav"
#macro SAVE_FILE "save.sav"

globalvar settingDataMap, saveDataMap;
settingDataMap=ds_map_secure_load(SETTINGS_FILE);
saveDataMap=ds_map_secure_load(SAVE_FILE);

show_debug_message(concat("setting map: ", settingDataMap, "  does setting map exist? ", ds_exists(settingDataMap, ds_type_map)));

if !ds_exists(settingDataMap, ds_type_map) {
	settingDataMap=ds_map_create();
	ds_map_secure_save(settingDataMap, SETTINGS_FILE);
}

if !ds_exists(saveDataMap, ds_type_map) {
	saveDataMap=ds_map_create();
	ds_map_secure_save(saveDataMap, SAVE_FILE);
}

function loadSetting(name, defaultValue=0) {
	var d=defaultValue;
	if ds_map_exists(settingDataMap, name) {
		d=settingDataMap[? name];
	}
	show_debug_message(concat("loaded ", name, " as ", d));
	return d;
}

function loadData(name, defaultValue=0) {
	var d=defaultValue;
	if ds_map_exists(saveDataMap, name) {
		d=saveDataMap[? name];
	}
	show_debug_message(concat("loaded ", name, " as ", d));
	return d;
}

function updateSetting(name, value) {
	settingDataMap[? name]=value;
	show_debug_message(concat("updated \"", name, "\": ", value));
}

function updateData(name, value) {
	saveDataMap[? name]=value;
	show_debug_message(concat("updated \"", name, "\": ", value));
}

function saveGame() {
	ds_map_secure_save(settingDataMap, SETTINGS_FILE);
	ds_map_secure_save(saveDataMap, SAVE_FILE);
	show_debug_message("GAME SAVED");
}

globalvar musicVolume, soundVolume, masterVolume, mumbaGraphicsOn, mumbaParticlesOn, mumbaMasterVolume, mumbaMusicVolume, mumbaSoundVolume;
musicVolume=loadSetting("musicVolume", 1);
soundVolume=loadSetting("soundVolume", 1);
masterVolume=loadSetting("masterVolume", 1);
mumbaGraphicsOn=loadSetting("mumbaGraphicsOn", 1);
mumbaParticlesOn=loadSetting("mumbaParticlesOn", 1);
mumbaMasterVolume=loadSetting("mumbaMasterVolume", 1);
mumbaMusicVolume=loadSetting("mumbaMusicVolume", 1);
mumbaSoundVolume=loadSetting("mumbaSoundVolume", 1);
audio_master_gain(masterVolume);

function saveDesktopFiles() {
	var files=ds_list_create();
	for (var i=0; i<instance_number(desktopFile); i++) {
		var inst=instance_find(desktopFile, i);
		var o=desktopFile,
		n="",
		si="",
		xx=20,
		yy=20;
		with inst {
			o=object_index;
			n=fileName;
			si=saveInfo;
			xx=nearestAcceptableX;
			yy=nearestAcceptableY;
		}
		var thisFile=ds_map_create();
		thisFile[? "objectIndex"]=object_get_name(o);
		thisFile[? "name"]=n;
		thisFile[? "saveInfo"]=si;
		thisFile[? "x"]=xx;
		thisFile[? "y"]=yy;
	
		files[| i]=ds_map_write(thisFile);
		
		ds_map_destroy(thisFile);
	}
	
	updateData("savedFiles", ds_list_write(files));
	
	saveGame();
	
	ds_list_destroy(files);
}

function loadDesktopFiles() {
	var savedFiles=ds_list_create();

	var defaultSavedFilesList=ds_list_create();
	
	ds_list_add(defaultSavedFilesList, ds_map_create());
	defaultSavedFilesList[| 0][? "objectIndex"]="textDocument";
	defaultSavedFilesList[| 0][? "name"]="Read Me!";
	defaultSavedFilesList[| 0][? "saveInfo"]="Hello, and welcome to Shrimp-OS!\n\nYou'll find your desktop looks pretty bare\nright now, but don't worry!\n\nJust open up \"Fireshrimp\" and you'll be able to find plenty of different shrimppages! Some of them might even contain downloadable programs!\n\nGet searching!";
	defaultSavedFilesList[| 0][? "x"]=20;
	defaultSavedFilesList[| 0][? "y"]=16;
	
	ds_list_add(defaultSavedFilesList, ds_map_create());
	defaultSavedFilesList[| 1][? "objectIndex"]="fireShrimpIcon";
	defaultSavedFilesList[| 1][? "name"]="Fireshrimp";
	defaultSavedFilesList[| 1][? "saveInfo"]="";
	defaultSavedFilesList[| 1][? "x"]=20;
	defaultSavedFilesList[| 1][? "y"]=56;

	for (var i=0; i<ds_list_size(defaultSavedFilesList); i++) {
		defaultSavedFilesList[| i]=ds_map_write(defaultSavedFilesList[| i]);
		show_debug_message(concat("default [", i, "]: ", defaultSavedFilesList[| i]));
	}

	var defaultStr=ds_list_write(defaultSavedFilesList);

	ds_list_destroy(defaultSavedFilesList);

	// loader
	ds_list_read(savedFiles, loadData("savedFiles", defaultStr));

	var failedFileLoad=false;
	for (var i=0; i<ds_list_size(savedFiles); i++) {
		var file=ds_map_create();
		show_debug_message(concat("loading [", i, "]: ", savedFiles[| i]));
		ds_map_read(file, savedFiles[| i]);
		var o=file[? "objectIndex"],
		n=file[? "name"],
		si=file[? "saveInfo"],
		xx=file[? "x"],
		yy=file[? "y"];
		var asset=asset_get_index(o);
		if is_string(o) && asset>=0 {
			var inst=instance_create_depth(xx, yy, 0, asset);
			with inst {
				nearestAcceptableX=xx;
				nearestAcceptableY=yy;
				fileName=n;
				saveInfo=si;
			}
		} else {
			failedFileLoad=true;
		}
		ds_map_destroy(file);
	}
	
	if failedFileLoad {
		createShrimpy("Uh-oh! One or more of your shrimptop files failed to load.");
	}
	
	ds_list_destroy(savedFiles);
}