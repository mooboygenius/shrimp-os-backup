if live_call() return live_result;

inString=string_lower(string_lettersdigits(inString));

swears=["pinoy", "shal", "pussy", "minge", "bollocks", "flipping", "chode", "bozo", "ass", "bastard", "bitch", "cock", "cunt", "fuck", "shit", "piss", "prick", "whore", "dick", "nigga", "nigger", "faggot"];
greetings=["hey", "hi", "hello", "greetings", "hola", "ni hao", "nihao", "bonjour", "kamusta", "oy", "oi", "who up"];

enum sentenceTypes {statement, question, exclamation}
sentenceType=sentenceTypes.statement;
tone=mood;

timer=random_range(50, 180);

#macro PISSED .125
#macro SAD .375
#macro NEUTRAL .625
#macro HAPPY .875
#macro OVERJOYED 1


inStringHas=function(text) {
	/// @function inStringHas(text...)
	if argument_count>1 {
		for (var i=0; i<argument_count; i++) {
			if string_pos(argument[i], string_lower(inString)) {
				return string_pos(argument[i], string_lower(inString));
			}
		}
	} else {
		return string_pos(text, string_lower(inString));
	}
}