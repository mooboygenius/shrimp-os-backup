if live_call() return live_result;
var m=1;
if beenThroughIntro m=5;
if pauseTime>0 && percentLoaded>pauseAtAmount {
	percentLoaded+=.025*m;
	pauseTime--;
} else {
	percentLoaded+=.5*m;
}
if percentLoaded>100 {
	percentLoaded=100;
	goTimer+=1*m;
	if goTimer>120 {
		doDraw=false;
		if goTimer>240 {
			beenThroughIntro=true;
			updateData("beenThroughIntro", true);
			saveGame();
			if loadData("beenThroughSetup", false) room_goto(rmTest) else room_goto(rmFirstTimeSetup);
		}
	}
} else {
	loadBlock+=.2;
}

show_debug_message(beenThroughIntro);