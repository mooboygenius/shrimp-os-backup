if live_call() return live_result;

event_inherited();


xpos=x;
ypos=y;

objBimsymanager.bimmusic=playSound(musBimsycutscene,1,1,1);

pointer=0;
canpress=0;
dest=0;

cutscene=[
sprBimsyCutscene1_1_1,
sprBimsyCutscene1_1_2,
sprBimsyCutscene1_1_3,
sprBimsyCutscene1_1_4,
sprBimsyCutscene1_1_5,
sprBimsyCutscene1_1_6,
sprBimsyCutscene1_1_7];
text=[
"These microgames only use the Z key!\nPress X to skip.",
"Hmmm....",
"Dang, it's empty! Now what am i gonna do...",
"Buh-buh-breaking news!",
"A new shop is opening in town... BIMSYMART!",
"...Bimsymart? What the hell?",
"I-I-I MEANT HECK!! I MEANT HECK!!!"];

switch(objBimsymanager.cutscene){
	default: break;
	case "1-1":
		cutscene=[
		sprBimsyCutscene1_1_1,
		sprBimsyCutscene1_1_2,
		sprBimsyCutscene1_1_3,
		sprBimsyCutscene1_1_4,
		sprBimsyCutscene1_1_5,
		sprBimsyCutscene1_1_6,
		sprBimsyCutscene1_1_7];
		text=[
		"These microgames only use the Z key!\nPress X to skip.",
		"Hmmm....",
		"Dang, it's empty! Now what am i gonna do...",
		"Buh-buh-breaking news!",
		"A new shop is opening in town... BIMSYMART!",
		"...Bimsymart? What the hell?",
		"I-I-I MEANT HECK!! I MEANT HECK!!!"];
	break;
	case "1-2":
		cutscene=[
		sprBimsyCutscene1_2_1,
		sprBimsyCutscene1_2_2,
		sprBimsyCutscene1_2_3,
		sprBimsyCutscene1_2_4,
		sprBimsyCutscene1_2_5,
		sprBimsyCutscene1_2_6,
		sprBimsyCutscene1_2_7];
		text=[
		"Ahhh, a whole lot of frozen foods!",
		"These should last me quite a while!",
		"*Psst psst* Is that him?",
		"*Whisper whisper* Isn't that..?",
		"Oh my god!!! It's Bimsy!!!",
		"You're the guy from the shop name!!!!",
		"...I never agreed to this..."];
	break;
	case "2-1":
		cutscene=[
		sprBimsyCutscene2_1_1,
		sprBimsyCutscene2_1_2,
		sprBimsyCutscene2_1_3,
		sprBimsyCutscene2_1_4,
		sprBimsyCutscene2_1_5,
		sprBimsyCutscene2_1_6,
		sprBimsyCutscene2_1_7,
		sprBimsyCutscene2_1_8,
		sprBimsyCutscene2_1_9];
		text=[
		"You'll need the arrow keys!\nPress X to skip.",
		"Nyum nyum nyum...",
		"Mmm... Tasty microflora.",
		"Gyack!!!!",
		"Heh... Well well well, a litle gummy bear!",
		"Um, actually!!! I'm a tardigrade!!!",
		"Eh. Tomato tomato.",
		"That expression doesn't work in the written form!",
		"Alright, that's it, you're going in my drink."];
	break;
	case "2-2":
		cutscene=[
		sprBimsyCutscene2_2_1,
		sprBimsyCutscene2_2_2,
		sprBimsyCutscene2_2_3,
		sprBimsyCutscene2_2_4,
		sprBimsyCutscene2_2_5,
		sprBimsyCutscene2_2_6];
		text=[
		"PHHBBBTT!!!",
		"ABUBUBUBUBUUBOUBOUBOU...",
		"Awawawa......",
		"Eheheheheh....",
		"That was fun, Beamsy! Do it again!",
		"I friggen HATE you."];
	break;
	case "3-1":
		cutscene=[
		sprBimsyCutscene3_1_1,
		sprBimsyCutscene3_1_2,
		sprBimsyCutscene3_1_3,
		sprBimsyCutscene3_1_4,
		sprBimsyCutscene3_1_5,
		sprBimsyCutscene3_1_6,
		sprBimsyCutscene3_1_7];
		text=[
		"No hints here!\nPress X to skip.",
		"Hell freaking yes!!!",
		"I can finally afford a computer!",
		"How do you start this thing..? Press any key?",
		"ShrimpOS, huh! So cool... I love shrimp...",
		"What's this, Shrimpgrounds? Videogames?",
		"Bring 'em on."];
	break;
	case "3-2":
		cutscene=[
		sprBimsyCutscene3_2_1,
		sprBimsyCutscene3_2_2,
		sprBimsyCutscene3_2_3,
		sprBimsyCutscene3_2_4,
		sprBimsyCutscene3_2_5,
		sprBimsyCutscene3_2_6];
		text=[
		"Heheheh... *Snrt* Aheheh...",
		"Video games....",
		"Marisha! What the hell are you doing?",
		"It's 6 AM!!! Why are you still up!?",
		"There's... Videogames in the computer...",
		"Wait forreal!? Let me try!!!"];
	break;
	case "4-1":
		cutscene=[
		sprBimsyCutscene4_1_1,
		sprBimsyCutscene4_1_2,
		sprBimsyCutscene4_1_3,
		sprBimsyCutscene4_1_4,
		sprBimsyCutscene4_1_5,
		sprBimsyCutscene4_1_6,
		sprBimsyCutscene4_1_7,
		sprBimsyCutscene4_1_8,
		sprBimsyCutscene4_1_9];
		text=[
		"A remix with no end!\nPress X to skip.",
		"Dear God... It's me, Bimsy.",
		"...How's it hangin'?",
		"Anyways... Please bestow unto me, your cutest lamb...",
		"A cool new higher form of faith... Or something.",
		"Okithanksbyeeee!!!",
		"*!!ZZZAAAAPPP!!*",
		"...Huh?",
		"What the heck is this?"];
	break;
	case "5-1":
		cutscene=[
		sprBimsyCutscene5_1_1,
		sprBimsyCutscene5_1_2,
		sprBimsyCutscene5_1_3,
		sprBimsyCutscene5_1_4,
		sprBimsyCutscene5_1_5,
		sprBimsyCutscene5_1_6,
		sprBimsyCutscene5_1_7,
		sprBimsyCutscene5_1_8,
		sprBimsyCutscene5_1_9];
		text=[
		"Welcome to hell.\nPress X to skip.",
		"I've finally found it...",
		"The maw of hephaestus.",
		"With this ancient furnace, I can finally achieve my dream.",
		"Metamorphosis.",
		"A hellish new coating...",
		"A pelt of devilish panko...",
		"...",
		"I'M A FRIED SHRIMP, BABY!!!"];
	break;
}


drawScript=function(x,y){
	draw_sprite(sprBimsyCutscenebg,0,0,0);
	draw_sprite(cutscene[pointer],image_index,0,0);
	
	draw_set_font(fntCut);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_colour($e8e0df);
	draw_text_ext(64,85,text[pointer],13,120);
	
}
