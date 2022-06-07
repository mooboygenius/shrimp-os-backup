if live_call() return live_result;

// Inherit the parent event
event_inherited();

seed=random_range(0,100);
//seed=string(current_day)+string(current_month);
random_set_seed(seed);

maxfr=42;

panel1=irandom_range(0,maxfr);
panel2=irandom_range(0,maxfr);
panel3=irandom_range(0,maxfr);

topics=["shrimp","shrimpcoin","politics","music","trends","comics","videogames","ugby mumba","bimsy",
"tom fulp","gasoline","fumes","smoke","mirrors","magnets","cordelia","sandals","tech","bros","tits",
"boobs","ass","memes","lolz","trolling","trolls","speed","coke","weed","helium","trains","drugs","acdc",
"sand","mist","ocean","rap","punk","environment","planet","plant","trees","recycling","france","italy",
"america","xmas","halloween","bunny","rabbit","shrimpos","spirit","soul","funk","coolness","irony",
"penis","pussy","fun","laughing","cringe","jack","prutte","plufmot","stepford","benny","zizou",
"levi","pico"];
topic=topics[irandom_range(0,array_length(topics)-1)];
topic2=topics[irandom_range(0,array_length(topics)-1)];

dials1=["so, what's this about "+topic+"?",
"so... "+topic+", huh?",
"it's a "+topic+" party today.",
"i'm feelin' kinda "+topic+".",
"no way, "+topic+"?",
"aw man, "+topic+"...",
"hey everyone.... i mean, "+topic+".",
"make today a "+topic+" day!",
topic+"? let's break it down.",
topic+".",
topic+", yep, that's right, "+topic+".",
"i've been hearing a lot about "+topic+" lately.",
"there's just not enough "+topic+" right now."];

dials1b=["bah!",
"see if i care.",
"now that's neat.",
topic+"!!!",
topic+"...",
"or rather, "+topic2+".",
"that's it.",
"ya get it now?",
"oh boy...",
"here we go.",
"strap in, boys.",
"this one's a good one.",
"it's all the rage!",
"it's a "+topic+" drought."];

dials1c=["i guess.",
"fuckin'... whatever.",
"hi btw.",
topic+"!",
topic+" is good.",
"i like "+topic,
topic+", yup.",
"you disgust me."];

dials2=["honestly, i don't care all that much.",
topic+" is pretty alright i think.",
"blah, blah, blah...",
topic+"... there's not much to say about it.",
topic+", well, you know what's up with it, right?",
topic+" is so new-age.",
topic+"...",
topic+"! hahaha! ya feel?",
"when i think about "+topic+"... god.",
"i tried "+topic+" and well... Eh.",
"but... i prefer "+topic2,
"actually... i hate "+topic,
"i really wanted to like "+topic+".",
"well, "+topic+", what's the verdict?"];

dials2b=["it's no biggie.",
"see what i mean?",
"ehh...",
"compared to "+topic2+"...",
"ya feel me?",
"it's a fucking mess.",
"there, i said it.",
"i really did.",
"i'm serious.",
"yeah, forreal."];

dials2c=["it's true!",
"lol.",
"just kidding.",
"fuck everything.",
"nah, fuck it.",
"eh, i don't really care.",
"it's fine either way.",
"honestly..."];

dials3=["i'll try not to stress over it, ok?",
"that's "+topic+", everybody!!",
"it ain't worth it...",
"i hate "+topic+".",
"but, well... it's not that great.",
"no words can explain.",
"fuck "+topic+" to hell and back."];

dials3b=["byeeee!!",
"haha.",
"whatever.",
topic+", lol...",
"lulz.",
"This sucks...",
"see ya next time, bitch!!",
"next time: "+topic2+"?"];

dials3c=["whatevs.",
"heh.",
"peace out.",
"i love "+topic+" so much!"];

dial1=dials1[irandom_range(0,array_length(dials1)-1)];
dial2=dials2[irandom_range(0,array_length(dials2)-1)];
dial3=dials3[irandom_range(0,array_length(dials3)-1)];

if(irandom_range(0,1)){
	dial1+=" "+dials1b[irandom_range(0,array_length(dials1b)-1)];
}
if(irandom_range(0,1)){
	dial1+=" "+dials1c[irandom_range(0,array_length(dials1c)-1)];
}
if(irandom_range(0,1)){
	dial2+=" "+dials2b[irandom_range(0,array_length(dials2b)-1)];
}
if(irandom_range(0,1)){
	dial2+=" "+dials2c[irandom_range(0,array_length(dials2c)-1)];
}
if(irandom_range(0,1)){
	dial3+=" "+dials3b[irandom_range(0,array_length(dials3b)-1)];
}
if(irandom_range(0,1)){
	dial3+=" "+dials3c[irandom_range(0,array_length(dials3c)-1)];
}

ypos=0;
