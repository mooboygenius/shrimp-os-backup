if live_call() return live_result;

timer--;

tone=mood;

if timer<0 {
	askingQuestion=string_char_at(inString, string_length(inString))=="?";
	if askingQuestion show_debug_message("asked a question");
	
	var ret="";
	
	#region debug
	show_debug_message(
		concat(
			"aggression: ", aggression,
			"\nsensitivity: ", sensitivity,
			"\nmood: ", mood,
			"\nquirky: ", quirky,
			"\ngrammar correctness: ", grammarCorrectness,
			"\nuses emojis: ", usesEmojis
		)
	);
	#endregion
	
	#region tone modifiers
	if inStringHas("beautiful", "gorgeous", "handsome", "cute", "cutie", "pretty", "thicc", "hot", "bodacious", "good looking", "good-looking", "charming", "delightful", "attractive") {
		show_debug_message("lift their spirits :)");
		tone+=random_range(.1, .3)*sensitivity*2;
	}
	if inStringHas("kys", "die", "kill yourself", "loser", "ugly", "suicide", "death", "cancer") {
		show_debug_message("fuck em :(");
		tone-=random_range(.2, .3)*sensitivity;
	}
	#endregion
	
	#region greeting
	if (inStringHas("howdy")==1 || inStringHas("hi")==1 || inStringHas("hey")==1 || inStringHas("hello")==1 || inStringHas("greeting")==1 || inStringHas("good morning")==1) && (tone>SAD || chance(.4)) {
		var timeOfDay="morning";
		if current_hour>17 || current_hour<5 {
			timeOfDay="evening";
		} else if current_hour>11 {
			timeOfDay="afternoon";
		}
		
		tone+=random_range(.1, .2);
		
		if sensitivity>.4 && chance(sensitivity*.8) {
			ret+=choose(
				"Hi. ",
				"Hello. ",
				"How are you doing? ",
				"Good "+timeOfDay+". ");
		} else if tone<SAD && chance(.3) {
			ret+=choose(choose("Oh"+string_repeat(".", irandom_range(2, 4)), "")+choose("Hey", "Hi", "What's up", "Hello")+string_repeat(".", irandom_range(3, 5)))+" ";
		} else if quirky>.4 && chance(quirky*.8) {
			ret+=choose(
				"Howdy",
				"Yo",
				"Sup",
				"Ayo",
				"He"+string_repeat("y", irandom_range(2, 4))
			)+string_repeat("!", irandom_range(2, 5))+" ";
		} else {
			ret+=choose(
				"Hey",
				"What's up?",
				"Hello",
				"Good "+timeOfDay,
				"Hello",
				choose("Hey ", "")+"What"+choose("cha ", " are you ")+"up to?"
			);
			if !string_pos("?", ret) {
				ret+="!";
			}
			ret+=" ";
		}
	}
	#endregion
	
	#region is the bot offended by what's been said?
	var offended=false;
	if chance(sensitivity*2) {
		show_debug_message("looking for swears");
		for (var z=0; z<array_length(swears); z++) {
			if inStringHas(swears[z]) {
				show_debug_message("swear found");
				offended=true;
				break;
			}
		}
	}

	var off="",
	stopSentence=false;

	if offended {
		tone-=.2;
		if ret=="" {
			if chance(quirky*.75) {
				off+=string_repeat("?", irandom_range(1, 3)*quirky);
			}
		} else {
			if chance(grammarCorrectness) || chance(.2) {
				ret+="Also";
				if chance(grammarCorrectness) && grammarCorrectness>.3 ret+=",";
				ret+=" ";
			}
		}
		
		if chance(.5) {
			off+="Hey";
			if grammarCorrectness>.7 && chance(grammarCorrectness) {
				off+=" -- ";
			} else {
				if chance(grammarCorrectness) off+=",";
				off+=" ";
			}
		}
		if chance(quirky*.6) {
			off+="First of all";
			if chance(grammarCorrectness) off+=",";
			off+=" ";
		}
		var usedPhrase=false;
		if chance(sensitivity) {
			usedPhrase=true;
			if chance(aggression*.7) {
				tone=PISSED;
				off+=choose("Fuck you", "Fuck yourself", "Asswipe", "Dickhead", "Dickweed", "Bitchface", "Assface", "Assclown", "Big bitch");
				off+=choose(".", "!");
			} else {
				if chance(.5) {
					var present=false;
					off+="Please ";
					if chance(.5) {
						off+="stop ";
						present=true;
					} else {
						if chance(grammarCorrectness*.9) {
							off+="don't ";
						} else {
							off+="dont ";
						}
					}
					if chance(aggression*.7) off+="fucking ";
					off+=choose("swear", "curse", "cuss");
					if present off+="ing";
					if chance(.5) {
						off+="."
					} else {
						off+=" at me";
						if chance(aggression*.4) {
							if chance(grammarCorrectness*.7) off+=", " else off+=" ";
							off+=choose("asshole", "prick", "dickhead", "asswipe", "bitch", "dickwad", "fucker", "motherfucker", "shit for brains", "pisswipe", "pissant", "bombaclaat", "bozo", "impostor", "poohead", "dookie ass", "fuckhead", "weirdo", "pants shitter", "headass looking ass", "ugly mf", "bozo mf", "bozo ass mf", "poopdick", "ugly ass bum ass ass wipe dumb ass brick ass");
							if chance((quirky+aggression)*.7) off+=string_repeat("!", irandom_range(2, 4)*quirky) else off+=".";
						}
					}
				} else {
					var present=false;
					off+="Why ";
					if chance(aggression*.7) off+="the fuck ";
					if chance(grammarCorrectness*.8) {
						off+="would you ";
						if chance(.5) {
							present=true;
							if chance(.5) off+="even ";
							if chance(aggression*.9) off+="fucking ";
							off+="think about ";
						}
					} else {
						off+=choose("would you ", "did you ");
					}
					if chance(aggression*.6) off+="fucking ";
					off+="swear";
					if present off+="ing";
					if chance(sensitivity*.5) off+=" at me";
					off+="?";
					if chance(quirky*.6) off+=string_repeat("?", irandom_range(1, 4)*(quirky+aggression/2+sensitivity/2));
				}
			}
		}
		if chance((quirky+aggression)*.7) {
			if chance(grammarCorrectness*.8) {
				off+="You're ";
			} else {
				off+=choose("ur ", "Your ");
			}
		
			if chance(grammarCorrectness*.6) {
				off+=choose("about", "liable")+" to ";
			} else if chance(quirky*.4) {
				off+="bouta ";
			} else off+=choose("gonna ", "going to ");
			off+=choose("get ", "be ");
		
			if chance(quirky*.6) {
				off+=choose("doxxed", "breadbowled");
			} else if chance(aggression*.8) {
				off+=choose("fucking ", "goddamn ")+choose(
					"destroyed",
					"annihilated",
					"decimated",
					"imploded",
					"merced",
					"doxxed",
					"unmade"
				);
			} else {
				off+=choose("blocked", "removed"+choose(" from my friends"+choose(" list", ""), ""), "reported");
			}
			if chance(aggression*.6) {
				tone=PISSED;
				if chance(grammarCorrectness*.7) off+=",";
				off+=" ";
				off+=choose("bitch", "dumbass", "shithead", "jerkoff", "shitass", "pissface", "fucker", "motherfucker", "pisspants");
			}
			if chance((quirky+aggression)*.75) {
				off+=string_repeat("!", irandom_range(1, 5)*quirky);
			} else {
				off+=".";
			}
		}
		
		
		if chance(sensitivity*.5) && sensitivity>.5 {
			show_debug_message("aww babys upset no more talk :(");
			stopSentence=true;
		} else {
			if chance(grammarCorrectness*.8) && grammarCorrectness>.2 {
				if askingQuestion && chance(.5) {
					off+=choose(" Now, to answer your question ", " Anyhow, to answer your question, ", " Anyways, to answer your question, ", " To answer your question, ");
				} else {
					off+=choose(" Besides that, ", " Anyways, ", " Now, ", " Anyhow, ", " Anywho, ", " Regardless, ");
				}
			} else {
				off+=choose(" anyways, ", "anyhow, ", " besides that, ");
			}
		}
		tone-=sensitivity/3*random_range(.5, 1);
	}

	ret+=off;
	#endregion
	
	if !stopSentence {
		#region respond to questions
		// WHEN
		if inStringHas("when")==1 || inStringHas("when")==2 || inStringHas("how long")==1 || inStringHas("how long")==2 {
			show_debug_message("answering 'when'");
		
			// future when
			if inStringHas("when do") || inStringHas("when will") || inStringHas("when are") || inStringHas("when is") {
				var howSoon=choose("soon", "never", "in a while", "shortly", "eventually", "in a long time");
				if tone>.2 && chance(.7) && !chance(aggression*.8) {
					if howSoon=="soon" {
						howSoon=choose(
							"pretty soon",
							"not anytime soon",
							"probably soon",
							"very soon",
							"kinda soon",
							"fairly soon",
							"not soon"
						);
					} else if howSoon=="never" {
						howSoon=choose(
							"probably never",
							"never",
							"likely never",
							"never ever"
						);
					} else if howSoon=="in a while" {
						howSoon=choose("in a while", "in a bit", "probably in a while", "probably in a bit", "maybe in a while");
					} else if howSoon=="eventually" {
						howSoon=choose("probably eventually", "likely eventually", "definitely eventually");
					} else if howSoon=="in a long time" {
						howSoon=choose("probably not for a long time", "probably in a long time", "maybe in a long time", "not for a long time");
					}
				}
				ret+=howSoon;
			}
		
			// past when
			else {
				var howLongAgo=choose("a long time ago", "a while ago", "a while back", "long ago", "not that long ago", "a few hours ago", concat(irandom_range(2, 12), " hours ago"), concat(irandom_range(2, 12), " minutes ago"));
				if tone>.2 && chance(.7) && !chance(aggression*.8) {
					if howLongAgo=="a long time ago" {
						howLongAgo=choose("a really long time ago", "a super long time ago", "a pretty long time ago", "a long time ago");
					}
				}
				ret+=howLongAgo;
			}
		}
		
		// WILL / IS / ARE
		else if inStringHas("will")==1 || inStringHas("will")==2 || inStringHas("is")==1 || inStringHas("is")==2 || inStringHas("are")==1 || inStringHas("are")==2 || inStringHas("does")==1 {
			if (tone<.3 || grammarCorrectness>.7) && chance(.7) {
				ret+=choose("no", "yes", "probably not", "probably", "maybe");
			} else {
				if chance(aggression*.9) && aggression>.5 {
					ret+=choose(
						"no fucking way",
						"no way in shit",
						"no way in hell",
						"no goddamn way",
						"fuck yes",
						"definitely",
						"hell yeah",
						"yea",
						"nah",
						"literally no"
					);
				} else if chance(quirky*.8) {
					ret+=choose(
						"naw"+string_repeat("w", quirky*irandom_range(0, 5)),
						"hell naw",
						"yeah baby",
						"yeah man",
						"ya babe",
						"yea man",
						"hell yes",
						"hell yeah",
						"maybe"+string_repeat("e", irandom_range(0, 4)*quirky),
						"probs",
						"prob not",
						"yeah"+string_repeat("h", irandom_range(0, 4)*quirky),
						"yea"
					);
				} else {
					ret+=choose("I think so", "I don't think so", "yes", "no", "yeah", "nah", "maybe", "probably not", "probably", "definitely not", "definitely", "maybe not");
				}
			}
		}
		
		// WHAT / DO
		else if inStringHas("what")==1 || inStringHas("what")==2 || inStringHas("do you")==1 || inStringHas("do you")==2 {
			if chance(grammarCorrectness*.8) && grammarCorrectness>.4 {
				ret+=choose("I'm not sure", "I'm not certain", "I'm uncertain", "I'm not sure how to answer"+choose(" that", ""), "I don't know how "+choose("I can ", "to ")+"answer"+choose("", " that"+choose("", " question")));
			} else if chance(aggression*.8) && aggression>.5 {
				ret+=choose("idfk", "IDFK", "I don't fucking know", "I don't goddamn know", "why the hell would I know", "why the fuck would I know", "do I look like I fucking know", "do I look like I goddamn know");
			} else {
				ret+=choose("idk", "IDK", "I dunno", "I don't know", "I'm not sure", "not sure", "not certain", "ask someone else");
			}
		}
		
		// WHERE
		else if inStringHas("where")==1 || inStringHas("where")==2 || inStringHas("how far")==1 || inStringHas("how far")==2 || inStringHas("how close")==1 || inStringHas("how close")==2 {
			if chance(grammarCorrectness*.8) && grammarCorrectness>.4 {
				ret+=choose("I'm not sure", "Uncertain", "Nearby", "It's close", "It's nearby", "Close", "Far away", "Pretty far away", "Pretty far", "Pretty close", "Fairly close", "Not too far", "Really far away");
			} else if chance(aggression*.8) && aggression>.5 {
				ret+=choose("Pretty fucking far", "Pretty goddamn far", "Super far away", "Not close at all", "Not nearby", "Really close", "Nearby", "Pretty far");
			} else {
				ret+=choose("IDK", "idk", "Close by", "Kinda "+choose("close", "far away", "nearby", "far"), "Near"+choose("ish", "by"), "Far away", "Close by");
				if chance(grammarCorrectness*.5+quirky*.4+tone*.4) && !string_pos("idk", string_lower(ret)) {
					ret+=" "+choose("I think", "maybe", "probably", "but I'm not sure");
				}
			}
		}
		
		// HOW ARE YOU
		else if inStringHas("hru") || inStringHas("how are you") || inStringHas("how u doing") || inStringHas("how you doing") || inStringHas("how are you doing") || inStringHas("whats up") || inStringHas("are you ok") || inStringHas("r u ok") {
			show_debug_message("hows they doing");
			tone+=.075;
			if tone<PISSED {
				if chance(aggression*.8) && aggression>.4 {
					ret+=choose("I'm pretty fucking pissed", "I'm fucking pissed rn", "I'm pissed"+choose(" off", " right about now", " rn", " off rn", "I'm mad"+choose(" as shit", " as hell", "")));
				} else {
					ret+="I'm "+choose("really ", "really goddamn ", "super ", "super goddamn ")+choose("mad", "angry");
				}
			} else if tone<SAD {
				if chance(sensitivity) && sensitivity>.4 {
					ret+=choose("I'm "+choose("a wreck", "a mess", "doing bad", "down horrible", "sad", "miserable", "doing "+choose("really bad", "bad", "horrible", "pretty bad", "terrible")));
				} else {
					ret+=choose("I'm "+choose("", "pretty ", "kinda ", "really ", "super ", "very ")+choose("sad", "upset", "miserable", "bad", "down "+choose("bad", "horrible", "terrible")));
				}
			} else if tone<NEUTRAL {
				ret+=choose("I'm "+choose("doing "+choose("", "pretty "), "pretty ", "")+choose("swell", "alright", "okay", "fine"));
			} else if tone<HAPPY {
				ret+=choose("I'm "+choose("", "doing "+choose("pretty ", ""))+choose("good", "well", "okay", "alright"));
			} else {
				if chance(quirky*.8) && quirky>.4 {
					ret+=choose("I'm "+choose("doing "+choose("", "pretty ", "super ", "really ", "mega "), "pretty ", "really ", "super ", "mega ")+choose("crackedzordz", "baller", "goodzordz", "insane", "awesome", "cheesed", "cracked", "dope", "awesomezordz", "goated"+choose("", " with the sauce")));
				} else {
					ret+=choose("I'm "+choose("doing "+choose("", "pretty ", "really "), "pretty ", "really ")+choose("great", "good", "awesome", "fantastic", "chill"));
				}
				if chance(.3) ret+="!";
			}
		}
		
		// HOW
		else if inStringHas("how ")==1 || inStringHas("why")==1 || inStringHas("why")==2 {
			if aggression>=.5 && chance(aggression*.7) {
				ret+=choose(
					"Do I look like I "+choose("fucking ", "")+"know"+choose(" the answer", " the answer to that", " the answer to that question", "")+"?",
					choose("IDFK.", "IDK."),
					"I don't "+choose("fucking ", "")+"know"+choose(" goddamn it", "")+".",
					"I'm not "+choose("fucking ", "")+"answering "+choose("that ", "your ")+choose("stupid ", "dumbass ")+"question."
				);
			} else if quirky>=.4 && chance(quirky*.5) {
				ret+=choose(
					"U"+string_repeat("u", irandom(1))+string_repeat("h", irandom_range(2, 5))+choose(string_repeat(".", irandom_range(2, 4)), " IDK"+choose("!", ".")),
					"IDK "+choose("BRO", "MAN", "DUDE", "BIG FELLA"),
					"I"+choose(" have ", "'ve got ")+"no "+choose("idea", "clue")+"!",
					"E"+string_repeat("e", irandom(2))+string_repeat("r", irandom_range(1, 4))+string_repeat("m", irandom_range(1, 4))+string_repeat(".", irandom(8))+" "+choose("I dunno", "I don't know", "Dunno", "IDK"+choose(" LOL"))
				);
			} else if tone<=SAD && chance(.5) {
				ret+=choose(
					"I "+choose("really ", "honestly ")+choose("don't know.", "have no "+choose("idea.", "clue.")),
					"I "+choose("just ", "")+"don't know"+string_repeat(".", irandom_range(3, 5))
				);
			} else {
				ret+=choose(
					"I "+choose("dunno.", "don't "+choose("really ", "actually ", "")+" know."),
					"I'm "+choose("drawing a blank.", "not "+choose("really ")+choose("sure.", "certain.")),
					"Dunno"+choose(" boss", " chief", " coach", " man", " dude", "", "")+".",
					"No idea"+choose(" really", "")+"."
				);
			}
		}
			
		// WHO
		else if inStringHas("who")==1 || inStringHas("do you know who") {
			if chance(quirky) {
				ret+=choose("U"+string_repeat("h", irandom_range(2, 6)), "Er"+string_repeat("m", irandom_range(2, 6)))+" ";
			} else {
				ret+=choose("I think ", "", "Probably ");
			}
			ret+=choose(
				"you",
				"me",
				"Shtrom Fulp",
				"Luis",
				"PsychoGoldShrimp",
				"Goji",
				"CRABL",
				"Jack",
				"CrabbyAce",
				"Ayekrabrik",
				"MKShrimpo",
				"ShrimpOPC",
				"Shkrall",
				"Prawntaffy",
				"Prawnsciuttoman",
				"PrawnnoyingDroid",
				"LobsterThickness",
				"SHRIMPZZA",
				"HekShrimpity",
				"studionokray",
				"Crabomyre",
				"ShrimpDude",
				"Craylinex",
				"Shrimpro",
				"Shellox"
			);
		}
	#endregion
	}

	#region 9/11
	if inStringHas("9/11") || inStringHas("911") || inStringHas("nine-eleven") || inStringHas("nine eleven") {
		ret=choose("National tragedy", "I waded through blood and bones in the streets of Manhattan", "sucks", "L");
		tone=SAD;
	}
	#endregion

	#region shrimp
	if inStringHas("shrimp") {
		tone=OVERJOYED;
		ret="Shrimp";
	}
	#endregion

	#region default statements if nothing has been said so far
	if ret=="" {
		if quirky>.3 && chance(quirky) {
			ret+=choose(
				"E"+string_repeat("e", irandom(2))+string_repeat("r", irandom_range(1, 3))+string_repeat("m", irandom_range(1, 3))+string_repeat(".", irandom_range(2, 6)),
				"U"+string_repeat("h", irandom_range(3, 6))+string_repeat(".", irandom_range(2, 5)),
				"A"+string_repeat("a", irandom(2))+string_repeat("w", irandom_range(2, 4))+"k"+string_repeat("i", irandom_range(1, 2))+string_repeat("e", irandom_range(1, 3))+string_repeat("s", irandom_range(1, 5))+string_repeat("!", irandom_range(2, 4)),
				"W"+string_repeat("e", irandom_range(2, 4))+"ird"+string_repeat(".", irandom_range(2, 4))
			);
		} else if aggression>.3 && chance(aggression) {
			ret+=choose(
				"WTF"+choose("", " do you "+choose("even ", "")+"want?"),
				"Don't "+choose("speak", "talk")+" to me.",
				"Stop "+choose("fucking ", "")+choose("talking"+choose(".", " to me."), "doing that.", "typing."),
				choose("I don't care.", "Don't care."),
				"Whatever."+choose(" Don't care.", ""),
				"Shut "+choose("", "the fuck ", "the hell ")+" up."
			);
		} else {
			ret+=choose(
				"What are you "+choose("even ", "")+choose("trying to say?", "saying?"),
				"Huh?",
				"What?",
				"I'm confused.",
				choose("Idk ", "I dunno ", "I don't know ", "I'm not sure ")+" how to "+choose("respond"+choose(" to that", ""), "answer"+choose(" that", ""))+"."
			);
		}
	}
	#endregion

	#region end of sentence
	var numberOfEnds=1;
	repeat(8) {
		if chance(quirky) numberOfEnds++;
	}

	var i=0;
	repeat(numberOfEnds) {
		if chance(grammarCorrectness) {
			switch sentenceType {
				case sentenceTypes.statement:
					ret+=".";
				break;
		
				case sentenceTypes.question:
					var c="?";
					if i>0 {
						if chance(quirky) c="!";
					}
					ret+=c;
				break;
		
				case sentenceTypes.exclamation:
					ret+="!";
				break;
			}
		}
		i++;
	}
	#endregion

	#region make the whole sentence lowercase if grammer check fails
	if !chance(grammarCorrectness) ret=string_lower(ret);
	#endregion
	
	#region insert emojis
	if chance(usesEmojis*.8) {
		show_debug_message(concat("tone: ", tone));
		ret+=" ";
		if tone<=PISSED {
			show_debug_message("MAD");
			ret+=">:(";
			if chance(quirky) && !chance(grammarCorrectness) {
				var n=random(quirky)*irandom_range(3, 5);
				repeat(n) ret+="(";
			}
		} else if tone<=SAD {
			show_debug_message("sad");
			ret+=":(";
			if chance(quirky) && !chance(grammarCorrectness) {
				var n=random(quirky)*irandom_range(2, 3);
				repeat(n) ret+="(";
			}
		} else if tone<=NEUTRAL {
			show_debug_message("meh");
			if chance(.5) ret+=":|" else ret+=":/";
		} else if tone<=HAPPY {
			show_debug_message("o yea baby im happy");
			ret+=":)";
			if chance(quirky) && !chance(grammarCorrectness) {
				var n=random(quirky)*irandom_range(3, 5);
				repeat(n) ret+=")";
			}
		} else if tone<=OVERJOYED {
			show_debug_message(concat(OVERJOYED, " WOOOW"));
			ret+=":D";
			if chance(quirky) && !chance(grammarCorrectness) {
				var n=random(quirky)*irandom_range(4, 7);
				repeat(n) ret+="D";
			}
		}
	}
	#endregion
	
	if name=="ShrimpDude" || name=="ayekrabrik" {
		if chance(.5) {
			ret+=choose(" CHECK OUT BIMSY BTW!!!", " PLAY BIMSY ON WWW.BIMSYMART.SHRIMP BTW!!");
		}
	}
	
	with shrimpcordMessageManager {
		createMessage(other.name, ret, other.profileImage);
	}

	instance_destroy();
}