if live_call() return live_result;

event_inherited();


xpos=x;
ypos=y;

canpress=0;
scrolly=128;

credits=[
"BIMSYMART",
"ShrimpOS Edition",
"",
"A game by Zizou",
"(@Tombdude)",
"",
"Special song",
"'Beamsy Jamboree'",
"By Prutte",
"",
"~STARRING~",
"",
"Gooberthed",
"As Bimsy",
"",
"Frankero",
"As Sec",
"",
"ItsReddQueen",
"As Marisha",
"",
"Fruitmasseuse",
"As Beamsy",
"",
"Tombdude",
"As Gamio",
"",
"Petet",
"As Himself Yes",
"",
"~FEATURING~",
"",
"Parallel Pan!c",
"By Maf & Zizu",
"",
"Peter the Ant",
"By Plufmot",
"",
"Dead Estate",
"By Milkbarlads",
"",
"Shoot Trip Die",
"By Levi Ramirez",
"",
"Mad Sisters' Week Off",
"By Jun&Zizou&Prutte",
"",
"360 Degrees",
"By Stepford",
"",
"Rock Smasher",
"By Nokoi",
"",
"~SPECIAL THANKS~",
"",
"Jack",
"Ayekerik",
"Amaryllis",
"Taronuke",
"nightbuggg",
"Andyl4nd",
"Tom Fulp",
"Whynne",
"Wired",
"Babo",
"Moonsidesong",
"Emma",
"Arthur Lee",
"Wamiugi",
"Chin",
"James Rolfe",
"Paneton Sumletterz",
"Monoko & Monoe",
"God And Also Jesus",
"Dr Crygor",
"Travis Touchdown",
"Ronald",
"Maya",
"Matisse",
"Shanti",
"Pizzicato Five",
"Der",
"The Indie Grind",
"",
"And.....",
"",
"Fuck YOU",
"for playing!",
"Hahahahaha!!!",
"",
"In memory of",
"Bimsy Sakazaki",
"",
"<3"
];

objBimsymanager.bimmusic=playSound(musBimsycredits,1,1,1);


drawScript=function(x,y){
	draw_sprite(sprBimsyheavenbg,image_index,0,0);
	draw_sprite(sprBimsyZizou,current_time*0.01,0,0);
	
	
	draw_set_font(fntSilver);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	for(var i=0; i<array_length(credits); i++){
		bimoutlinetext(3,scrolly+16*i,credits[i],$e8fff5,$211f1b);
	}
	
	draw_sprite(sprBimsyCreditslogo,0,0,0);
	draw_sprite(sprBimsyCreditsleave,0,0,128);
}
