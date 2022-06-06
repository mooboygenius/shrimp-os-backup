if live_call() return live_result;

// Inherit the parent event
event_inherited();

lightColor=$A1C2FF;
darkColor=$70AEFF;

posts=ds_list_create();

createPost=function(t, s=noone) {
	/// @function createPost(text, [sprite])
	
	var inst=instance_create_depth(-100, -100, depth-10, crustachanPost);
	
	with inst {
		sprite=s;
		text=t;
	}
	
	ds_list_add(posts, inst);
	ds_list_add(children, inst);
}

createPost("/shrimpcoin/bros, I've got something that you're gonna like.\n\nAccess to Shrimpcoin miners has become overregulated. Why? Because the feds can't get their grubby little paws on our Shrimpcoin wallets. It's time to make a change. For every site hosting a download for a miner that they take down, I will make sure that ten go back up.\n\nConsider this a... \"gift\":\n\nwww.prawncave.shrimp", sprCrustachanIlluminati);
createPost("my mom wants me to stop talking to you guys", sprCrustachanCat);
createPost("Do you think that there's really a heaven out there somewhere? What about hell?", sprCrustachanAdam);
createPost(".", sprCrustachanInception);
createPost("Should I get extra cheese on my pizza or a regular amount of cheese with pepperoni?\nI'm bringing a girl home later tonight and I really need to impress her.\nWhat do I do bros?", sprCrustachanPizza);
createPost("do people only play this game for the breasts or is it actually good", sprCrustachanDeadEstate);