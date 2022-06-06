function playSound(sound, priority=0, pitch=1, loops=false) {
	audio_sound_pitch(sound, pitch);
	return audio_play_sound(sound, priority, loops);
}

globalvar currentMusic, currentMusicIndex;
currentMusic=noone;
currentMusicIndex=-10000;

function playMusic(music, loops=true) {
	audio_group_stop_all(bgm);
	currentMusic=playSound(music, 100, 1, loops);
	return currentMusic;
}

function playMusicFromIndex(index) {
	var music=getSongAudio(index);
	currentMusicIndex=index;
	return playMusic(music);
}

#region songs
globalvar songs;
songs=ds_list_create();

function createSong(audio=bgmShrimpOS, name="???", artist="???", art=sprDefaultSongArt) {
	var n=ds_list_size(songs);
	songs[| n]=ds_map_create();
	songs[| n][? "audio"]=audio;
	songs[| n][? "name"]=name;
	songs[| n][? "artist"]=artist;
	songs[| n][? "art"]=art;
}

function getSongAudio(index) {
	return songs[| index][? "audio"];
}

function getSongName(index) {
	return songs[| index][? "name"];
}

function getSongArtist(index) {
	return songs[| index][? "artist"];
}

function getSongArt(index) {
	return songs[| index][? "art"];
}

createSong(bgmShrimpOS, "Shrimpos", "HeyOPC & Droid");
createSong(bgmShrimpSong, "Jeff Rosenshrimp", "studionokoi");
createSong(bgmBrandySong, "Shrimp Hacker", "BrandyBuizel");
createSong(bgmSponge, "Big Boy Rumble Tumble", "HeyOPC & Droid");
createSong(bgmShrimpBattle1, "Shrimp Battle #1", "HeyOPC");
createSong(bgmShrimpBattle2, "Shrimp Battle #2", "HeyOPC");
createSong(bgmDLTrack1, "Big Ass Shrimp", "DefaultLabs");
createSong(bgmDLTrack2, "Shrimp(eh)", "DefaultLabs");
createSong(bgmDLTrack3, "Coffee Time (feat. Patetfisk)", "DefaultLabs & Patetfisk");
createSong(bgmDLTrack4, "Untitled (feat. Patetfisk)", "DefaultLabs & Patetfisk");
createSong(bgmDLTrack5, "Untitled (Moose Remix)", "DefaultLabs & Moose");
createSong(bgmDLTrack6, "F Lydian", "DefaultLabs");
createSong(bgmDLTrack7, "Breather (Chiptami Remix)", "DefaultLabs & Chiptami");
createSong(bgmDryShrimpOS, "Shrimp OS", "Dry");
createSong(bgmDryShrimpFi, "Shrimp-Fi", "Dry");
createSong(bgmNowEnteringTheShrimpNexus, "Now Entering the Shrimp Nexus", "Magibauble");
createSong(bgmShrookie, "Shrookie", "Crashtroid");
createSong(bgmDemisurge, "Shrimp Rock", "Demisurge");
#endregion

function setAudioBaseGains() {
	var array=-1;
	for (var i=0; audio_exists(i); i++) {
		array[i]=audio_sound_get_gain(i);
	}
	return array;
}