if live_call() return live_result;

event_inherited();

var s=140;
setWindowSize(self, x, y, s, s);
settingButtons=[];
createSettingButton=function(n, d="") {
	/// @function createSettingButton(name, [default])
	var inst=instance_create_depth(-100, -100, depth-10, textButton);
	with inst {
		lockSize=true;
		image_xscale=7;
		sprite_index=sprButton;
		name=n;
		text=concat(n, d);
	}
	ds_list_add(children, inst);
	array_push(settingButtons, inst);
	return inst;
}

masVolButton=createSettingButton("Master gain: ", round(masterVolume*10));
with masVolButton {
	clickFunction=function() {
		masterVolume-=.1;
		if masterVolume<0 masterVolume=1;
		updateData("masterVolume", masterVolume);
		text=concat(name, round(masterVolume*10));
	}
}

bgmVolButton=createSettingButton("BGM gain: ", round(musicVolume*10));
with bgmVolButton {
	clickFunction=function() {
		musicVolume-=.1;
		if musicVolume<0 musicVolume=1;
		updateData("musicVolume", musicVolume);
		text=concat(name, round(musicVolume*10));
		with game adjustGains();
	}
}


sfxVolButton=createSettingButton("SFX gain: ", round(soundVolume*10));
with sfxVolButton {
	clickFunction=function() {
		soundVolume-=.1;
		if soundVolume<0 soundVolume=1;
		updateData("soundVolume", soundVolume);
		text=concat(name, round(soundVolume*10));
		with game adjustGains();
	}
}

deleteFileButton=createSettingButton("Delete save data");
with deleteFileButton {
	clickFunction=function() {
		instance_create_depth(-1000, -1000, depth-1, deleteSaveWindow);
	}
}