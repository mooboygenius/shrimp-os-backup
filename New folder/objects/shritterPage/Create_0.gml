if live_call() return live_result;

// Inherit the parent event
event_inherited();

trends=ds_list_create();

ds_list_add(trends, "#shrimpcoin", "Toiletgate", "Lonesome Shitter", "Henry Pluckerbum", "Better Call Shal", "#disease", "#shrimpify", "Shrimpcord Hack", "Shrimpcord", "Shrimpcord Virus", "Bimsy", "Shteam", "#bimsy", "#shrimpcord", "#bimsy", "Ugby Mumba", "#ugbymumba", "2 boys 1 shrew", "Shrew virus", "Obama theory", "Punkie promise", "porn", "man jumps", "worm cave", "gooners reunite");
ds_list_shuffle(trends);

activeTrends=ds_list_create();
for (var i=0; i<4; i++) {
	ds_list_add(activeTrends, trends[| i]);
}

ds_list_destroy(trends);

allPosts=ds_list_create();
createShritterPost=function(n, t, pfp=choose(sprPFPShrimpcord, sprPFPShrimpcordRed, sprPFPShrimpcordYellow, sprPFPShrimpcordGreen)) {
	/// @function createShritterPost(name, text, profilePicture)
	ds_list_add(allPosts, ds_map_create());
	var c=ds_list_size(allPosts)-1;
	if n=="" {
		n=choose("insane", "manly", "badass", "dope", "awesome", "", "", "", "")+choose("frog", "poop", "woman", "man", "pee", "weenie", "wingus")+choose("lover", "farter", "smasher", "destroyer", "king", "queen", "guy", "boy", "bro", "", "", "", "")+concat(choose(irandom(100)), "", "");
	}
	allPosts[| c][? "name"]=n;
	allPosts[| c][? "text"]=t;
	allPosts[| c][? "profilePicture"]=pfp;
}

createShritterPost("ayekrabrik", "beavis and cuphead", sprPFPKai);
createShritterPost("ayekrabrik", "all our food keeps blowing up", sprPFPKai);
createShritterPost("ayekrabrik", "really cool skeletons are rolling down your neighborhood", sprPFPKai);
createShritterPost("ayekrabrik", "fucked up in the crib sipping dr perky", sprPFPKai);
createShritterPost("ayekrabrik", "pussy (automated)", sprPFPKai);
createShritterPost("ayekrabrik", "DINNER", sprPFPKai);
createShritterPost("ayekrabrik", "pink lemonade sour belts", sprPFPKai);
createShritterPost("ayekrabrik", "big ass head goddamn", sprPFPKai);
createShritterPost("ayekrabrik", "the diahrea... it won...", sprPFPKai);
createShritterPost("ayekrabrik", "everyone who downloads mumba gets put on a list", sprPFPKai);
createShritterPost("LobsterThickness", "I came here to be alone", sprPFPLinethickness);
createShritterPost("LobsterThickness", "I CANT STAND UP FOR FALLING DOWN", sprPFPLinethickness);
createShritterPost("LobsterThickness", "Man, this guys british? I thought I had problems", sprPFPLinethickness);
createShritterPost("LobsterThickness", "I got the BIGGEst Turd ever check it out", sprPFPLinethickness);
createShritterPost("LobsterThickness", "IGNORE THIS TO SUPPORT SATAN LIKE AND RESHRIMP IF YOU LOVE JESUS", sprPFPLinethickness);
createShritterPost("LobsterThickness", "Yo this guy next to me just bought 4 fish", sprPFPLinethickness);
createShritterPost("LobsterThickness", "Gender", sprPFPLinethickness);
createShritterPost("Shkrall", "Shrimp rights", sprPFPShal);
createShritterPost("Shkrall", "Thinking about causing something", sprPFPShal);
createShritterPost("Shkrall", "B sale 25mil", sprPFPShal);
createShritterPost("Shkrall", "I love cocking", sprPFPShal);
createShritterPost("Shkrall", "glug glug glug", sprPFPShal);
createShritterPost("Shkrall", "I'm fucked up.", sprPFPShal);
createShritterPost("Shkrall", "I love you", sprPFPShal);
createShritterPost("Shkrall", "The power that comes from the love of a father is unmatched.", sprPFPShal);
createShritterPost("Goji", "Im goji", sprPFPGoji);
createShritterPost("Goji", "I am ready to embrace change", sprPFPGoji);
createShritterPost("jack", "i'm only jack after all", sprPFPJack);
createShritterPost("jack", "i eat soap all the time", sprPFPJack);
createShritterPost("jack", "my name is jack", sprPFPJack);
createShritterPost("jack", "huh??? huh?", sprPFPJack);
createShritterPost("jack", "I hope my doordash driver and i can become friends i hope we can play gamecube in my room after he drops my food off", sprPFPJack);
createShritterPost("jack", "you guys are fucekd. you are fucked", sprPFPJack);
createShritterPost("prawntaffy", "ah", sprPFPPoptaffy);
createShritterPost("prawntaffy", "thinking about her again.", sprPFPPoptaffy);
createShritterPost("prawntaffy", "wouldnt wish the shit I deal with on my enemies.", sprPFPPoptaffy);
createShritterPost("studionokray", "whats the deal with airline food", sprPFPJeff);
createShritterPost("studionokray", "did you know im utterly insane?", sprPFPJeff);
createShritterPost("studionokray", "stream bury by annoyingdroid", sprPFPJeff);
createShritterPost("studionokray", "in september i will buy a fish", sprPFPJeff);
createShritterPost("studionokray", "today i will buy a fish\nnext week i will buy a fish", sprPFPJeff);
createShritterPost("studionokray", "There is a killer on the loose in ur area. Close ur windows lock ur doors. Pray he doesn’t find u.", sprPFPJeff);
createShritterPost("Shrimpro", "my ass itches", sprPFPTyro);
createShritterPost("Shrimpro", "i bought a fish", sprPFPTyro);
createShritterPost("Shrimpro", "yeah, you may be verified on shritter, but do you have a comically large pencil?", sprPFPTyro);
createShritterPost("Shrimpro", "i know you've been feeling ugby lately but just keep pushing through it itll get mumba eventually", sprPFPTyro);
createShritterPost("Shrimpro", "#KeepShrimpingOn", sprPFPTyro);
createShritterPost("ShrimpDude", "shritter user ayekrabrik keeps sending me dead animal photos in my dms", sprPFPZizou);
createShritterPost("ShrimpDude", "there are millions of shrimps crawling all over me.", sprPFPZizou);
createShritterPost("shrimpOPC", "Brian Ropers Plastic Chair Cave - 80 ft whip", sprPFPHeyOPC);
createShritterPost("shrimpOPC", "Colonel Sanders is trolling the r/writingprompts subreddit.", sprPFPHeyOPC);
createShritterPost("shrimpOPC", "my brain just keep s going.....", sprPFPHeyOPC);
createShritterPost("shrimpOPC", "Ext.: Mario & Luigi are Hanging Out at Bowser's Castle", sprPFPHeyOPC);
createShritterPost("PrawnnoyingDroid", "i found my lost long twin in rob blox", sprPFPDroid);
createShritterPost("", "HOW THE FUCK DO I GET SHRIMPCOIN???");
createShritterPost("", "lol my shrimpcord account got hacked\ngreat service @Shrimpcord");
createShritterPost("", "I heard shrimpify is gonna start charging monthly soon. What the fuck?");
createShritterPost("", "No NGPR?");
createShritterPost("", "Yes NGPR?");
createShritterPost("", "I got banned from krillit for telling people where to download a shrimpcoin miner.\nTheir loss!");
createShritterPost("", "So uhhh anyone else get sent a goddamn VIRUS LINK on shrimpcord??\nSeriously fix youre shit!!! @Shrimpcord");
createShritterPost("", "how do i make a shrimpgrounds account?");
createShritterPost("", "wtf where can i play Friday Night Crustacean");
createShritterPost("", "Shrimpify -- what a great service!\nThey've got all my favorite HeyOPC tracks :)");
createShritterPost("", "PSA FOR ALL SHRIMPCOIN ENTHUSIASTS:\n\nTHERE IS A VIRUS-FREE LINK FOR A SHRIMPCOIN MINER ON www.4crustachan.shrimp!");
createShritterPost("", "Just downloaded a shrimpcoin miner from 4crustachan.\nlets see if i get a virus!!");
createShritterPost("", "How come ALL of my shrimpcord friends are getting hacked??");
createShritterPost("", "anyone watched the latest Help Gaming?");
createShritterPost("", "good f*cking Lord. Craigsshrimp price gouging is ABSURD");
createShritterPost("", "Shrimposer might be the best DAW i ever used!!");
createShritterPost("", "Has anyone here used Shrimp Paint?");
createShritterPost("", "The new Bimsy game is so freaking cool!! Go download it from www.bimsymart.shrimp!!");
createShritterPost("", "really loving the new Bimsy game - how come its not on shteam??");
createShritterPost("", "GO GET BIMSY FROM WWW.BIMSYMART.SHRIMP IF YOU HAVENT ALREDY!!!");
createShritterPost("", "GODDAMN has anyone played Ugby Mumba on shteam yet??");
createShritterPost("", "Shrimp-OS is an illusion.");
createShritterPost("", "go get ugby mumba from Shteam if u havent yet!!");
createShritterPost("", "did @jack spam anyone else with virus links on shrimpcord?");
createShritterPost("", "uhhh Im pretty sure @jack just send me a virus on shrimpcord lmao");
createShritterPost("", "@jack Why are you sending people viruses on Shrimpcord??");

ds_list_shuffle(allPosts);

posts=ds_list_create();

for (var i=0; i<8; i++) {
	var n=allPosts[| i][? "name"],
	t=allPosts[| i][? "text"],
	pfp=allPosts[| i][? "profilePicture"];
	
	inst=instance_create_depth(-1000, -1000, depth-10, shritterPost);
	
	with inst {
		text=t;
		name=n;
		profileSprite=pfp;
	}
	
	ds_list_add(posts, inst);
	ds_list_add(children, inst);
}

var num=instance_number(shritterPost);
if chance(.6) {
	with instance_find(shritterPost, irandom(num)) {
		text="just a heads up DO NOT MESSAGE ME ON SHRIMPCORD i got hacked and my account is sending people COMPUTER WORMS";
		name="jack";
		profileSprite=sprPFPJack;
	}
}

if chance(.5) {
	with instance_find(shritterPost, irandom(num)) {
		text="PLEASE for the love of christ visit WWW.BIMSYMART.SHRIMP";
		name="ShrimpDude";
		profileSprite=sprPFPZizou;
	}
}

if chance(.3) {
	with instance_find(shritterPost, 0) {
		name=choose("Shrimpify", "Shrimpcord");
		if name=="Shrimpcord" {
			text="Chat with your friends anytime, anywhere! Download SHRIMPCORD from www.shrimpcord.shrimp TODAY!";
			if chance(.5) text="We are working to handle the current account hijacking situation.\n\nSee www.shrimpcord.shrimp for more info.";
			profileSprite=sprPFPShrimpcord;
		} else if name=="Shrimpify" {
			text="All of your favorite songs are available on Shrimpify for free!\nDownload NOW from www.shrimpify.shrimp!";
			profileSprite=sprPFPShrimpify;
		}
		name+="   (Promoted)";
	}
}

if !loadData("visitedShritter", false) || chance(.1) {
	with createShrimpy("Shritter is a great shrimpsite to discover new information! If you see a word or phrase that jumps out to you, try looking it up on www.shrimple.shrimp!") {
		destroyScript=function() {
			timer++;
			if timer>600 state=1;
		}
	}
	updateData("visitedShritter", true);
	saveGame();
}