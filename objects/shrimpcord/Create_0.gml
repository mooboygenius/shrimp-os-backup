if live_call() return live_result;

event_inherited();

var w=160,
h=120;
setWindowSize(self, 0, 0, GAME_WIDTH, GAME_HEIGHT-sprite_get_height(sprTaskbar));

var userID=0;
ds_map_add(userID, "username", "test");

enum userStatus {
	online,
	away,
	doNotDisturb,
	offline
}

users=ds_map_create();
userList=ds_list_create();
createUser=function(name, description="", profilePicture=sprShrimpcordDefaultIcon, mood=.5, aggression=.5, sensitivity=.5, quirky=.5, grammarCorrectness=.5, usesEmojis=.5, status=userStatus.offline, messengerObject=shrimpcordAutomessenger) {
	/// @function createUser(name, [description], [profilePicture], [mood], [aggression], [sensitivity], [quirky], [grammarCorrectness], [usesEmojis], [status], [messengerObject])
	ds_map_add(users, name, ds_map_create());
	users[? name][? "name"]=name;
	users[? name][? "description"]=description;
	users[? name][? "profilePicture"]=profilePicture;
	users[? name][? "status"]=status;
	users[? name][? "mood"]=mood;
	users[? name][? "aggression"]=aggression;
	users[? name][? "sensitivity"]=sensitivity;
	users[? name][? "quirky"]=quirky;
	users[? name][? "grammarCorrectness"]=grammarCorrectness;
	users[? name][? "usesEmojis"]=usesEmojis;
	users[? name][? "messengerObject"]=messengerObject;
	ds_list_add(userList, name);
}

#region FREAKS
createUser("jack", "pusssy.....", sprPFPJack, .4, 1, 1, .5, .2, .5, 0, shrimpcordJackMessenger);
createUser("shrimpOPC", "The signature Taco bell toast", sprPFPHeyOPC, .6, 0, .6, .4, 0, .6);
createUser("Shkrall", "Hate this motherfucker", sprPFPShal, .5, 0, 1, 0, 1, 0);
createUser("prawntaffy", "Its carson!!", sprPFPPoptaffy, .7, 0, .6, .4, .4, .7);
createUser("Prawnsciuttoman", "huhhhh?? huhh?d", sprPFPProsciuttoMan, .4, 0, 0, 0, .4, 0);
createUser("PrawnnoyingDroid", "dDawwwww aww", sprPFPDroid, .4, 0, .4, 1, .6, .8);
createUser("CrabbyAce", "ace!!", sprPFPAce, .5, 1, .4, .5, 0, .3);
createUser("LobsterThickness", "cat??", sprPFPLinethickness, .7, .3, .3, .8, .7, 0);
createUser("ayekrabrik", "Fuck this person.", sprPFPKai, .9, 1, 1, 1, 0, .7);
createUser("Goji", "cant think of a pun", sprPFPGoji, .7, .1, .4, .3, 0, .8);
createUser("CRABL", "dick", sprPFPDogl, .3, 1, .5, 0, .8, 0);
createUser("SHRIMPZZA", "mommy", sprPFPMerel, .6, 1, .2, .4,  1, .1);
createUser("HekShrimpity", "HEKSHRIMPITY", sprPFPJon, 0, .6, .3, .2, .8);
createUser("studionokray", "Jeffrey", sprPFPJeff, 0, 0, 1, .3, .1, .2);
createUser("Crabomyre", "pinoy", sprPFPGrobles, .4, 0, 0, .7, 0, .3);
createUser("ShrimpDude", "zizoumongus", sprPFPZizou, 1, .1, .5, 1, .2, .8);
createUser("Craylinex", "neopet on", sprPFPDay, 1, .3, .5, 1, 0, 1);
createUser("Shrimpro", "bawwww", sprPFPTyro, 1, 0, .2, .4, 0, .1);
createUser("Shellox", "germ", sprPFPGel, .5, .4, .6, .3, .1, .4);
#endregion

ds_list_shuffle(userList);

userObjects=ds_list_create();

var o=22,
xx=0,
yy=0;
for (var i=0; i<ds_list_size(userList); i++) {
	var t=userList[| i];
	if ds_map_exists(users, t) {
		var inst=instance_create_depth(xx, yy, depth-1, shrimpcordProfileButton),
		n=users[? t][? "name"],
		d=users[? t][? "description"],
		pp=users[? t][? "profilePicture"],
		s=users[? t][? "status"],
		md=users[? t][? "mood"],
		agg=users[? t][? "aggression"],
		sen=users[? t][? "sensitivity"],
		quir=users[? t][? "quirky"],
		gram=users[? t][? "grammarCorrectness"],
		emo=users[? t][? "usesEmojis"],
		mes=users[? t][? "messengerObject"];
		with inst {
			messenger=mes;
			mood=md;
			aggression=agg;
			sensitivity=sen;
			quirky=quir;
			grammarCorrectness=gram;
			usesEmojis=emo;
			name=n;
			description=d;
			profilePicture=pp;
			status=s;
			image_xscale=2.5;
			image_yscale=o/sprite_get_height(sprite_index);
		}
		ds_list_add(children, inst);
		ds_list_add(userObjects, inst);
		yy+=o;
	}
}

substate=0;
friendsListScroll=0;
friendsListScrollLerp=0;

coolColor=$996F68;

unlockMedal("Well-groomed");