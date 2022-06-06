//if live_call() return live_result;

event_inherited();

with decor {
	x=other.x;
	y=other.y-other.sprite_yoffset-sprite_yoffset;
	z=other.z
	owner=other;
}

for (var i=0; i<array_length(nextCoins); i++) {
	with nextCoins[i] {
		if status==mumbaLevelState.unlocked other.forcedToWait=true;
		if status>mumbaLevelState.unlocked other.doIt=true;
	}
}

var j=0;
for (var i=0; i<array_length(nextCoins); i++) {
	if is_undefined(ds_list_find_value(dots, i)) {;
		if doIt {
			var nx=x, ny=y, nz=z;
			with nextCoins[i] {
				show_debug_message(concat("next coin: ", id));
				nx=x;
				ny=y;
				nz=z;
				show_debug_message(concat("next x: ", nx, ", next y: ", ny));
			}
			var distance=point_distance(x, y, nx, ny),
			dir=point_direction(x, y, nx, ny),
			k=0,
			a=8,
			ad=distance/(a),
			ax=x,
			ay=y;
			if forcedToWait nz=-200;
			show_debug_message(concat("distance: ", distance, "; direction: ", dir));
		
			var md=16,
			sl=ds_list_size(dots);
			show_debug_message(concat("dots list size: ", sl));
			if sl<=i {
				show_debug_message(concat("created dots list ", i));
				var l=ds_list_create();
				dots[| i]=l;
				repeat(a) {
					ax+=lengthdir_x(ad, dir);
					ay+=lengthdir_y(ad, dir);
					if point_distance(ax, ay, x, y)>md && point_distance(ax, ay, nx, ny)>md {

						ds_list_add(dots[| i], instance_create_depth(ax, ay, depth+10, mumbaLSDot));
					
						with dots[| i][| k] {
							show_debug_message(concat("created [| ", i, "][| ", k, "]"));
							gotoX=ax;
							gotoY=ay;
							z=nz;
							if other.forcedToWait {
								grace=30;
								z=-200;
							}
							//show_debug_message(concat(id, ": ", gotoX, ", ", gotoY));
						}
					
						if !instance_exists(parentWindow) parentWindow=instance_nearest(0, 0, mumbaWindow);
					
						with parentWindow {
							ds_list_add(children, other.dots[| i][| k]);
						}
					
						k++;
					}
				}
			}
		}
	}
}

if ds_exists(dots, ds_type_list) {
	for (var i=0; i<ds_list_size(dots); i++) {
		for (var q=0; q<ds_list_size(dots[| i]); q++) {
			//show_debug_message(concat("[", i, ", ", z, "] ", instance_exists(dots[| i][| z])));
			var inst=dots[| i][| q];
			with inst {
				z=lerp(z, other.z+wave(-2, 2, 1, x/2+y/100), .1);
			}
		}
	}
}
	
	
var allowed=false;
with owner allowed=allowMovement;

if status==mumbaLevelState.unlocked {
	switch state {
		case 0:
			z=-200;
			timer++;
			if timer>60 {
				state=1;
				timer=0;
			}
		break;
		
		case 1:
			if gameFrame%5==0 setCameraShake(1);
			z+=.5;
			if grace<-5 grace=1;
			if z>-8 {
				timer=0;
				state=2;
				z=-8;
				grace=20;
				repeat(10) {
					createMumbaParticle(x+random_range(-1, 1)*sprite_xoffset, y+random_range(-1, 1), mumbaDustParticle);
				}
				setCameraShake(4);
			}
		break;
		
		case 2:
			timer++;
			if timer>30 {
				with owner allowMovement=true;
				status=mumbaLevelState.incomplete;
				timer=0;
				state=0;
			}
		break;
	}
} else if active && allowed {
	
	var playerIsOn=false;
	with mumbaLSMumba {
		if state==0 && point_distance(x, y, other.x, other.y)<16 playerIsOn=true;
	}
	
	if playerIsOn || state>1 {
		switch state {
			case 0:
				if !instance_exists(coolName) {
					coolName=instance_create_depth(0, 0, -1000, mumbaLSDetails);
					
					show_debug_message(concat("perfect: ", perfectDataString,
					"\ntime trial: ", timeTrialDataString,
					"\nhard mode: ", clearedHardModeDataString,
					"\neggathon: ", eggathonDataString));
					
					with coolName {
						sprite_index=generateSprite(other.name);
						medalsArray=[];
						var n=0;
						
						if other.status==mumbaLevelState.complete {
							if other.perfectDataString!="" {
								medalsArray[n]=[sprMumbaSmallHealthMedal, !other.perfectCleared];
								n++;
							}
						
							if other.timeTrialDataString!="" {
								medalsArray[n]=[sprMumbaSmallTimeMedal, !other.timeTrialCleared];
								n++;
							}
						
							if other.clearedHardModeDataString!="" {
								medalsArray[n]=[sprMumbaSmallHardModeMedal, !other.hardModeCleared];
								n++;
							}
						
							if other.eggathonDataString!="" {
								medalsArray[n]=[sprMumbaSmallEggsMedal, !other.eggathonCleared];
								n++;
							}
						}
					}
					
					with parentWindow {
						if ds_list_find_index(children, other.coolName)<0 {
							ds_list_add(children, other.coolName);
						}
					}
					state=1;
				}
				
			case 1:
				with parentWindow {
					if ds_list_find_index(children, other.coolName)<0 {
						ds_list_add(children, other.coolName);
					}
				}
				if grace<-10 grace=2;
				if input(mumbaInputJump, PRESS) {
					state=2;
					timer=0;
					with mumbaLSMumba {
						playMumbaSound(sfxMumbaLevelSelectChoose, 100, 1);
						playMumbaSound(sfxMumbaJump, 100, 1);
						state=2;
						zSpeed=-5;
						squish=.2;
						verticalSpeed=4;
						zWeight=.2;
					}
					with coolName {
						state=levelSelectDetailStates.destroy;
					}
				}
			break;
			break;
			
			case 2:
				timer++;
				if timer>120 {
					timer=0;
					state=3;
				}
			break;
			
			case 3:
				var upBanner=noone, lowBanner=noone;
				with owner {
					upBanner=banner;
					lowBanner=bannerLower;
				}
				var spd=4;
				with upBanner {
					depth=-1000;
					yOffset+=spd;
				}
				with lowBanner {
					yOffset-=spd;
				}
				timer++;
				if timer>60 {
					stopMumbaMusic();
					var ms=instance_create_depth(0, 0, 0, mumbaModeSelect);
					var n=name;
					with ms {
						levelName=n;
						normalLevelObject=other.normalLevelObject;
						hardLevelObject=other.hardLevelObject;
						endlessLevelObject=other.endlessLevelObject;
						shopObject=other.shopObject;
						levelDataString=other.dataString;
						
						timeTrialDataString=other.timeTrialDataString;
						clearedHardModeDataString=other.clearedHardModeDataString;
						eggathonDataString=other.eggathonDataString;
						perfectDataString=other.perfectDataString;

						timeTrialCleared=other.timeTrialCleared;
						hardModeCleared=other.hardModeCleared;
						eggathonCleared=other.eggathonCleared;
						perfectCleared=other.perfectCleared;
					}
					with parentWindow {
						ds_list_insert(children, 0, ms);
					}
					with owner {
						instance_destroy();
					}
					timer=0;
					state=4;
				}
			break;
		}
	} else {
		state=0;
	}
} else {
	if instance_exists(coolName) {
		with coolName {
			if state<levelSelectDetailStates.destroy state=levelSelectDetailStates.destroy;
		}
	}
}

drawScript=function(x, y) {
	if status<mumbaLevelState.complete {
		shader_set(shGrayscale);
	}
	defaultDrawScript(x, y+z);
	shader_reset();
}