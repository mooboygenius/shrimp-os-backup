if live_call() return live_result;

// Inherit the parent event
event_inherited();

posts=ds_list_create();

createKrillitPost=function(n, d="", fi=noone, t=sprKrillitDefaultThumbnail, r=[]) {
	/// @function createKrillitPost(name, [description], [fullImage], [thumbnail], [replies])
	var inst=instance_create_depth(-1000, -1000, depth-1, krillitPost);
	with inst {
		text=n;
		thumbnail=t;
		fullImage=fi;
		description=d;
		replies=r;
	}
	ds_list_add(posts, inst);
	ds_list_add(children, inst);
}

var defaultThumbnail=sprKrillitDefaultThumbnail;

createKrillitPost("Sweet bird", "found this out side", sprKrillitFunnyBird, sprKrillitFunnyBirdThumbnail, ["Dope", "Looks like my wife! (joke, sorry honey)", "I miss my dad"]);

createKrillitPost("Anyone know where a fella can find a Shrimpcoin miner?", "I can't buy stuff on Craigsshrimp without Shrimpcoin, I can't get Shrimpcoin without a miner, and I can't get a miner because the asshole mods on this rank shitstain of a site keep deleting links to them. What's a boy to do?!", noone, defaultThumbnail, ["Keep this just between you and me...\nThere's a link to one available on www.4crustachan.shrimp.\nThe site won't appear in Shrimple or any other shearch engine, you gotta type it in the address bar manually. Keep this hush-hush, okay? Our little secret.\n\nHappy mining.", "MY FRIEND TOLD ME U CAN GET A MINER ON WWW.4CRUSTACHAN.SHRIMP HAHA I AM FUCKED UP!!!!!I "]);

createKrillitPost("Been doing a lot of thinking (about Shrimp)", "I have a 24.5 x 12 x 12 inch plastic tub of bathwater that I have been farming shrimp in for the last three years. There's currently about 940 shrimp inside the box and I have to wonder -- do they hate it in there? Do they have feelings just like you and me? Am I a despot for confining these poor, innocent creatures to a plastic prison? What should I do?", sprKrillitShrimp, sprKrillitShrimpThumbnail, ["You're a sick piece of shit.", "Fuck your entire life.", "You should be ashamed of yourself, you animal.", "how do i get my fallout new vegas mod load order workign", "Fuck. You."]);

createKrillitPost("AMA: My piss has been BROWN for 4 days", "I dunno what's up with this.", sprKrillitToilet, sprKrillitToiletThumbnail, ["OP, you really need to get that checked out by a professional. This is no laughing matter and you could be dead within a matter of days.", "get a life cockegg", "Jesus Christ. Is this really what people are upshrimping these days?...\n\nThis isn't the site I joined five years ago."]);

createKrillitPost("Krillit: I (32M) have been putting a little bit of bleach in my GF's (17F) food because she said Ugby Mumba 2 was better than Ugby Mumba 3 - AITA?", "see title", noone, defaultThumbnail, ["Completely justified.", "Dude you're girlfriend is a minor wtf is wrong with you", "Where do I download Ugby Mumba 2? I've only seen 1 and 3 on Shteam..."]);

createKrillitPost("I saw a man get crushed under the wheels of a semi and I did nothing to help or stop it.", "", noone, defaultThumbnail, ["alright"]);

createKrillitPost("Shrimpcoin up 1,000,000.00%!!", "KEEP HOLDING!!!!", sprKrillitGraph, sprKrillitGraphThumbnail, ["Thought about the environment recently, jackass?", "Idk what this is but cool", "WHERE CAN I GET A SHRIMPCOIN MINER??"]);

createKrillitPost("CONFESSION - My wife cheated on me with a prawn but i still love her", "Good God above why must you burden a man with the desire for intimacy?", noone, defaultThumbnail, ["You probably deserved it, looking at your post history."]);

createKrillitPost("Just found this really helpful website for guides on how to beat old videogames. www.helpgaming.shrimp!", "www.helpgaming.shrimp", noone, defaultThumbnail, ["Helped!", "Helped!", "Helped!", "Helped!", "Helped!", "Helped!"]);

createKrillitPost("So how do I get my Shrimpcord account back once it's been hacked?", "", noone, defaultThumbnail, ["idk"]);

createKrillitPost("PSA: DON'T message Jack on Shrimpcord!", "I think his account is hacked. I messaged him and he sent me a super fishy link. Not opening it!\n\nOkay logging off now. My mom made mac and cheese for dinner.", noone, defaultThumbnail, ["I don't think Jack is hacked I think he's just unwell."]);

ds_list_shuffle(posts);