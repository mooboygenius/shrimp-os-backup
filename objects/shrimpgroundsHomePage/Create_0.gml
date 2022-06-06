if live_call() return live_result;

event_inherited();

artSubmissions=ds_list_create();
ds_list_add(artSubmissions, makeSubmission("Zamilda ShyneXSpritez", "Tombdude", "haiii everyone!! ^_^ so this is my mumba oc zamilda. shes a high schooler at mumba academy and recently awoke to her magic hell angel powers after having a dream about the shrimpangel scampiel who granted her this boon... so ummm yea baiiii", sprShrimpgroundsZizouArt, sprShrimpgroundsZizouArtThumbnail));
ds_list_add(artSubmissions, makeSubmission("Shal's Art", "Shal", "", sprShrimpgroundsShalArt, sprShrimpgroundsShalArtThumbnail));
ds_list_add(artSubmissions, makeSubmission("Goose", "Jack", "im only spunchbob affer all", sprShrimpgroundsGooseArt, sprShrimpgroundsGooseArtThumbnail));
ds_list_add(artSubmissions, makeSubmission("Shrimp Just Chilling", "Tombdude", "My shrimp pic. Do NOT bother me about it being inaccurate I didn't have an internet connection at the time and I couldn't look up reference images. Fuck OFF!!!!", sprShrimpgroundsZizou2Art, sprShrimpgroundsZizou2ArtThumbnail));
ds_list_add(artSubmissions, makeSubmission("Nice Shrimp", "Tombdude", "Just some drawing in a notebook.", sprShrimpgroundsZizou3Art, sprShrimpgroundsZizou3ArtThumbnail));
ds_list_add(artSubmissions, makeSubmission("Shrimpu is Hawt", "Tombdude", "", sprShrimpgroundsZizou4Art, sprShrimpgroundsZizou4ArtThumbnail));
ds_list_add(artSubmissions, makeSubmission("Nekochi eating Shrimp ramen", "Tombdude", "Just having an awesome little snack courtesy of her little shrimp friends!!! Oh yessss!!!!", sprShrimpgroundsZizou5Art, sprShrimpgroundsZizou5ArtThumbnail));
ds_list_add(artSubmissions, makeSubmission("sheep", "poptaffy", "its a sheep", sprShrimpgroundsPoptaffyArt, sprShrimpgroundsPoptaffyArtThumbnail));
ds_list_add(artSubmissions, makeSubmission("Ray", "plufmot", "", sprShrimpgroundsBennyRay, sprShrimpgroundsBennyRayThumbnail));
ds_list_add(artSubmissions, makeSubmission("Goon", "plufmot", "", sprShrimpgroundsBennyGoon, sprShrimpgroundsBennyGoonThumbnail));
ds_list_add(artSubmissions, makeSubmission("Benny", "plufmot", "", sprShrimpgroundsBennyBenny, sprShrimpgroundsBennyBennyThumbnail));
ds_list_add(artSubmissions, makeSubmission("Pliers", "FrosstyArt", "https://uncle-grandpa.fandom.com/wiki/Uncle_Grandpa_Wiki", sprShrimpgroundsPliers, sprShrimpgroundsPliersThumbnail));
ds_list_add(artSubmissions, makeSubmission("Chie's Art", "NoMoreChie", "", sprShrimpgroundsChie, sprShrimpgroundsChieThumbnail));
ds_list_add(artSubmissions, makeSubmission("Ratatan Sure Rocks!", "UnevenPrankster", "This bunny robot gal sure has lots of guns. Maybe... don't piss her off?", sprShrimpgroundsStarPrankster, sprShrimpgroundsStarPranksterThumbnail));
ds_list_add(artSubmissions, makeSubmission("Mark Pimento", "PukeBomb", "Unreasonably sweaty, oozing a fragrance of Arby’s meats, this mythical “salesman” offers countless wares to his loyal, yet displaced customers. CEO of Pimento Planet™, a thrift-like store that offers luxury washing machine alcoves, -568.56 °R circumscribed cooling, ancient antiquities, and edible arrangements such as Sonic popsicles.", sprShrimpgroundsPukeBomb, sprShrimpgroundsPukeBombThumbnail));
ds_list_add(artSubmissions, makeSubmission("Goon EP 2", "JRetrioX", "A teaser for episode 2 of the Goon series! Coming soon eventually. ", sprShrimpgroundsJRX, sprShrimpgroundsJRXThumbnail));
ds_list_add(artSubmissions, makeSubmission("Shrimp Gang", "FletcherEPS", "Watch out for the Pwning Prawns; pwning shrimp n00bs", sprShrimpgroundsFletcher, sprShrimpgroundsFletcherThumbnail));
ds_list_add(artSubmissions, makeSubmission("Jefvel's Art", "jefvel", "he is a happy man", sprShrimpgroundsJefvel, sprShrimpgroundsJefvelThumbnail));

ds_list_shuffle(artSubmissions);

featuredArt=ds_list_create();

audioSubmissions=ds_list_create();
ds_list_add(audioSubmissions, makeSubmission("Jeff Rosenshrimp", "studionokoi", "", bgmShrimpSong, sprShrimpgroundsMusicThumbnail));
ds_list_add(audioSubmissions, makeSubmission("Shrimp Hacker", "BrandyBuizel", "", bgmBrandySong, sprShrimpgroundsMusicThumbnail));
ds_list_add(audioSubmissions, makeSubmission("Shrimp Battle #1", "HeyOPC", "", bgmShrimpBattle1, sprShrimpgroundsMusicThumbnail));
ds_list_add(audioSubmissions, makeSubmission("Shrimp Battle #2", "HeyOPC", "", bgmShrimpBattle2, sprShrimpgroundsMusicThumbnail));
ds_list_add(audioSubmissions, makeSubmission("Shrimp OS", "Dry", "", bgmDryShrimpOS, sprShrimpgroundsMusicThumbnail));
ds_list_add(audioSubmissions, makeSubmission("Shrimp-Fi", "Dry", "", bgmDryShrimpFi, sprShrimpgroundsMusicThumbnail));
ds_list_add(audioSubmissions, makeSubmission("Now Entering the Shrimp Nexus", "Magibauble", "", bgmNowEnteringTheShrimpNexus, sprShrimpgroundsMusicThumbnail));
ds_list_add(audioSubmissions, makeSubmission("Shrookie", "Crashtroid", "", bgmShrookie, sprShrimpgroundsMusicThumbnail));
ds_list_shuffle(audioSubmissions);

featuredAudio=ds_list_create();

for (var i=0; i<4; i++) {
	var inst=instance_create_depth(-100, -100, depth-100, shrimpgroundsSubmissionButton),
	map=artSubmissions[| i],
	name=map[? "name"],
	author=map[? "author"],
	description=map[? "description"],
	resource=map[? "resource"],
	thumbnailSprite=map[? "thumbnailSprite"];
	with inst {
		visible=false;
		sprite_index=generateSubmission(name, author, description, resource, thumbnailSprite);
		owner=other;
		clickFunction=function() {
			var n=pieceName,
			a=authorName,
			d=descriptionText,
			r=myResource;
			with owner {
				var o=createNewPage(shrimpgroundsArtPage);
				o.assetName=n;
				o.author=a;
				o.description=d;
				o.art=r;
			}
		}
	}
	ds_list_add(children, inst);
	ds_list_add(featuredArt, inst);
}

for (var i=0; i<4; i++) {
	var inst=instance_create_depth(-100, -100, depth-100, shrimpgroundsSubmissionButton),
	map=audioSubmissions[| i],
	name=map[? "name"],
	author=map[? "author"],
	description=map[? "description"],
	resource=map[? "resource"],
	thumbnailSprite=map[? "thumbnailSprite"];
	with inst {
		visible=false;
		sprite_index=generateSubmission(name, author, description, resource, thumbnailSprite);
		owner=other;
		clickFunction=function() {
			var n=pieceName,
			a=authorName,
			d=descriptionText,
			r=myResource;
			with owner {
				var o=createNewPage(shrimpgroundsAudioPage);
				o.assetName=n;
				o.author=a;
				o.description=d;
				o.myAudio=r;
			}
		}
	}
	ds_list_add(children, inst);
	ds_list_add(featuredAudio, inst);
}