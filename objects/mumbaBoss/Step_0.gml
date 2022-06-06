if live_call() return live_result;

horizontalKnockback=0;
verticalKnockback=0;

event_inherited();

while place_meeting(x, y, mumbaWall) y--;

var scaleWave=wave(1, 1.1, 4),
yWave=wave(-1, 1, 2, .3)*3,
xWave=wave(-1, 1, 10)*64,
angleWave=wave(-1, 1, 3, .4)*10,
floorWidth=centerX*2,
halfway=hp<(maximumHp/2);

if halfway show_debug_message("HALFWAY");

switch state {
	case 0:
		timer++;
		if timer>60 {
			timer=0;
			state=1;
		}
	break;
	
	case 1:
		setCameraShake(2);
		var sc=1.3;
		image_xscale=lerp(image_xscale, sc, .3);
		if image_xscale>(sc-.1) {
			state=2;
		}
	break;
	
	case 2:
		var sc=.8;
		image_xscale=lerp(image_xscale, sc, .3);
		if image_xscale<(sc+.1) {
			state=3;
		}
	break;
	
	case 3:
		image_xscale=lerp(image_xscale, scaleWave, .3);
		timer++;
		if timer>60 {
			timer=0;
			
			createEye(20, 15, .6);
			createEye(18, 115, .8);
			createEye(24, 60, .5);
			createEye(12, 60, .4);
			createEye(23, 170, .6);
			createEye(27, 150, .4);
			createEye(19, 205, .4);
			createEye(22, 233, .6);
			createEye(16, 270, .4);
			createEye(23, 280, .3);
			createEye(18, 305, .3);
			createEye(18, 340, .8);
			
			ds_list_shuffle(eyes);
			
			var inst=instance_create_depth(x, y, depth-10, mumbaEyeBallBoss);
			with inst {
				offsetAngle=205;
				offsetLength=3;
				image_xscale=1.2;
				image_yscale=image_xscale;
			}
			with mumbaWindow ds_list_add(children, inst);
			ds_list_insert(eyes, 0, inst);
			
			with mumbaEyeBall {
				yScale=0;
				xScale=0;
				squish=1;
			}
			state=4;
		}
	break;
	
	case 4:
		timer++;
		var m=5,
		s=ds_list_size(eyes);
		for (var i=0; i<s; i++) {
			if (i*m)<(timer) {
				with eyes[| i] {
					xScale=1;
					yScale=lerp(yScale, 1, .5);
					if !playedSound {
						playedSound=true;
						playSound(sfxMumbaLand, 100, random_range(1.3, 1.5));
					}
				}
			}
		}
		
		if timer>((s+3)*m) {
			with mumbaEyeBall {
				xScale=1;
				yScale=1;
			}
			setSizeToHp=true;
			state=5;
			timer=0;
		}
	break;
	
	// idle
	#macro BOSS_IDLE_STATE 5
	case BOSS_IDLE_STATE:
		with mumbaEyeBallBoss {
			staringAtPlayer=true;
		}
		y=lerp(y, hoverY+yWave, .1);
		x=lerp(x, centerX+xWave, .01);
		angle=wave(angle, angleWave, .1);
		timer++;
		if timer>attackTime {
			horizontalSpeed=0;
			verticalSpeed=0;
			timer=0;
			if hp>(2/3*maximumHp) {
				switch currentAttack {
					case 0:
						state=BOSS_START_SLAM_STATE;
					break;
				
					case 1:
						state=BOSS_START_ROLL_STATE;
						currentAttack=-1;
					break;
				}
			} else {
				switch currentAttack {
					case 0:
						state=BOSS_START_RAIN_STATE;
					break;
					
					case 1:
						state=BOSS_START_ROLL_STATE;
					break;
					
					case 2:
						state=BOSS_START_SLAM_STATE;
					break;
				
					case 3:
						state=BOSS_START_SLAM_STATE;
						currentAttack=-1;
					break;
				}
			}
			currentAttack++;
		}
	break;
	
	// slam
	#macro BOSS_START_SLAM_STATE 6
	case BOSS_START_SLAM_STATE:
		with mumbaEyeBallBoss {
			staringAtPlayer=false;
			lookDirection=270;
		}
		var px=0;
		with mumbaPlayer px=x;
		var l=.05;
		if halfway l=.1;
		x=lerp(x, px, l);
		verticalSpeed=lerp(verticalSpeed, -.1, .1);
		if !audio_is_playing(sfxMumbaRumble) playMumbaSound(sfxMumbaRumble, 100, 1);
		timer++;
		if timer>240 {
			grace=10;
			squish=.3;
			verticalSpeed=10;
			state=7;
			playMumbaSound(sfxMumbaLevelSelectMove, 100, 1.3);
			setCameraShake(3);
		} else if timer>180 {
			if grace<-5 grace=2;
		} else if timer>120 {
			if grace<-15 grace=2;
		}
	break;
	
	case 7:
		if place_meeting(x, y+1, mumbaWall) {
			playMumbaSound(sfxMumbaRumble, 100, .8);
			playMumbaSound(sfxMumbaLouderExplosion, 100, .8);
			setCameraShake(4+halfway*2);
			grace=10;
			squish=.5;
			repeat(10) {
				createMumbaParticle(x+random_range(-1, 1)*30, y+30, mumbaDustParticle)
			}
			repeat(irandom_range(4, 8)) {
				createMumbaParticle(x+random_range(-1, 1)*30, y+30, mumbaRockCrumbleParticle)
			}
			with mumbaPlayer {
				if place_meeting(x, y+1, mumbaWall) {
					verticalKnockback=-4;
				}
			}
			timer=0;
			state=8;
			weight=.2;
			verticalSpeed=-2;
			with mumbaEyeBallBoss staringAtPlayer=true;
		}
	break;
	
	case 8:
		if place_meeting(x, y+1, mumbaWall) {
			squish=lerp(squish, wave(.1, .3, 5), .2);
		}
		timer++;
		if timer>120 {
			grace=5;
			squish=-.8;
			weight=0;
			horizontalSpeed=0;
			verticalSpeed=0;
			timer=0;
			state=BOSS_IDLE_STATE;
			playMumbaSound(sfxMumbaMenuConfirm, 100, .5);
		}
	break;
	
	#macro BOSS_START_ROLL_STATE 9
	case BOSS_START_ROLL_STATE:
		rollDirection=choose(-1, 1);
		state=10;
		grace=3;
		squish=.5;
	break;
	
	case 10:
		var p=48,
		xt=p;
		switch rollDirection {
			case -1:
				xt=centerX*2-p;
			break;
			
			case 1:
				xt=p;
			break;
		}
		with mumbaEyeBallBoss {
			lookDirection=90+other.rollDirection*90;
		}
		var l=.3;
		if halfway l=.5;
		x=lerp(x, xt, l);
		if point_distance(x, 0, xt, 0)<2 {
			x=xt;
			state=11;
			squish=-.2;
		}
	break;
	
	case 11:
		timer++;
		if timer>(10-halfway*5) {
			state=12;
			timer=0;
		}
	break;
	
	case 12:
		rollTurnSpeed+=.2;
		if halfway rollTurnSpeed+=.2;
		setCameraShake(rollTurnSpeed*.1);
		if rollTurnSpeed>20 {
			touchedGround=false;
			state=13;
			verticalSpeed=-3;
			weight=.2;
			horizontalSpeed=rollDirection*.1;
			grace=5;
			squish=-.4;
			rollTurnSpeed=10;
			setCameraShake(3);
			setSizeToHp=false;
		}
		if !audio_is_playing(sfxMumbaRumble) playMumbaSound(sfxMumbaRumble, 100, 1.5);
	break;
	
	case 13:
		if place_meeting(x, y+1, mumbaWall) {
			if !touchedGround {
				setCameraShake(3);
				touchedGround=true;
				grace=10;
				squish=.2;
			}
			if !audio_is_playing(sfxMumbaRumble) playMumbaSound(sfxMumbaRumble, 100, .9);
			setCameraShake(abs(horizontalSpeed)*.25);
			horizontalSpeed+=rollDirection*.05;
			if halfway horizontalSpeed+=rollDirection*.015;
			var m=6;
			if halfway m=7;
			horizontalSpeed=clamp(horizontalSpeed, -m, m);
			if chance(.3) createMumbaParticle(x-rollDirection*8, y+30, mumbaDustParticle);
			if abs(horizontalSpeed)>m/3 createMumbaParticle(x+rollDirection+random(24), y+30, mumbaRockCrumbleParticle);
			if abs(horizontalSpeed)>=6 timer++;
			if timer>(180) {
				if grace<-2 grace=1;
				if timer>240 {
					var p=48;
					if (rollDirection>0 && x+horizontalSpeed>(centerX*2-p)) || (rollDirection<0 && x+horizontalSpeed<p) {
						state=14;
						grace=20;
						squish=-.4;
						horizontalSpeed=0;
						verticalSpeed=-2;
						weight=.2;
						rollTurnSpeed=0;
						timer=0;
						repeat(6) createMumbaParticle(x+random_range(-1, 1)*24, y+30, mumbaRockCrumbleParticle);
						repeat(20) {
							var l=random(sprite_xoffset),
							d=random(360);
							createMumbaParticle(x+lengthdir_x(l, d), y+lengthdir_y(l, d), mumbaDustParticle);
						}
						playMumbaSound(sfxMumbaLouderExplosion, 100, 1.3);
						setCameraShake(5);
						angle=point_direction(0, 0, lengthdir_x(1, angle), lengthdir_y(1, angle));
						setSizeToHp=true;
					}
				}
			} else {
				if grace<-10 grace=2;
			}
		}
	break;
	
	case 14:
		with mumbaEyeBall {
			staringAtPlayer=false;
			lookDirection=random(360);
		}
		timer++;
		if timer>300 {
			setCameraShake(2);
			timer=0;
			grace=10;
			state=15;
			squish=-.25;
			playMumbaSound(sfxMumbaMenuConfirm, 100, .6);
			with mumbaEyeBall {
				staringAtPlayer=true;
			}
		} else if timer>240 {
			if grace<-5 grace=2;
		} else if timer>180 {
			if grace<-10 grace=1;
		}
	break;
	
	case 15:
		timer++;
		if timer>40 {
			timer=0;
			state=BOSS_IDLE_STATE;
			weight=0;
			squish=-.5;
			grace=5;
			setCameraShake(2);
		}
	break;
	
	#macro BOSS_START_RAIN_STATE 16
	case BOSS_START_RAIN_STATE:
		grace=10;
		squish=-.5;
		state=17;
	break;
	
	case 17:
		var ty=hoverY-32;
		y=lerp(y, ty, .2);
		x=lerp(x, centerX, .2);
		if point_distance(x, y, centerX, ty)<2 {
			setCameraShake(1);
			x=centerX;
			y=ty;
			timer=0;
			state=18;
			grace=1;
			squish=.2;
			horizontalSpeed=-.2;
		}
	break;
	
	case 18:
		timer++;
		if !audio_is_playing(sfxMumbaRumble) playMumbaSound(sfxMumbaRumble, 100, 1.3);
		if timer>90 {
			state=19;
			horizontalSpeed=15;
		} else if timer>30 {
			if grace<-10 grace=1;
		}
	break;
	
	case 19:
		if (x+horizontalSpeed)>(centerX*2-48) {
			playMumbaSound(sfxMumbaLoudExplosion, 100, 1.2);
			squish=-.5;
			grace=10;
			setCameraShake(5);
			repeat(10) {
				createMumbaParticle(x+30, y+random_range(-1, 1)*24, mumbaDustParticle);
			}
			repeat(20) {
				createMumbaParticle(random(floorWidth), y-random_range(32, 64), mumbaRockCrumbleParticle);
			}
			verticalSpeed=random_range(-1, 1)*.05;
			horizontalSpeed*=-.8;
			state=20;
		}
	break;
	
	case 20:
		angle+=20;
		if !audio_is_playing(sfxMumbaRumble) playMumbaSound(sfxMumbaRumble);
		if (x+horizontalSpeed)<(48) {
			playMumbaSound(sfxMumbaLoudExplosion, 100, 1);
			squish=-.5;
			grace=10;
			setCameraShake(5);
			repeat(20) {
				createMumbaParticle(x+30, y+random_range(-1, 1)*24, mumbaDustParticle);
			}
			repeat(40) {
				createMumbaParticle(random(floorWidth), y-random_range(32, 64), mumbaRockCrumbleParticle);
			}
			horizontalSpeed=0
			state=21;
			angle=point_direction(0, 0, lengthdir_x(1, angle), lengthdir_y(1, angle));
			with mumbaEyeBallBoss {
				staringAtPlayer=false;
			}
			verticalSpeed=1;
			var n=8;
			repeat(n) {
				var inst=instance_create_depth(random(floorWidth), y-random_range(96, 300), depth-10, mumbaFallingRock);
				with inst {
					verticalSpeed=2.4;
				}
				with parentWindow {
					ds_list_insert(children, 0, inst);
				}
			}
		}
	break;
	
	case 21:
		angle=lerp(angle, 0, .01);
		with mumbaEyeBallBoss {
			lookDirection=random(360);
		}
		timer++;
		if timer>300 {
			timer=0;
			state=22;
			grace=5;
			squish=.5;
			horizontalSpeed=0;
			verticalSpeed=0;
			with mumbaEyeBallBoss {
				staringAtPlayer=true;
			}
		} else if timer>240 {
			if grace<-10 grace=2;
		} else {
			if grace<-30 {
				grace=2;
				squish=random_range(-1, 1)*.2;
				repeat(4) {
					createMumbaParticle(x+random_range(-30, 30), y+random_range(-30, 30), mumbaDustParticle);
				}
			}
		}
		x=lerp(x, centerX, .001);
		y=lerp(y, hoverY, .001);
		verticalSpeed=lerp(verticalSpeed, 0, .2);
	break;
	
	case 22:
		timer++;
		if timer>30 {
			playMumbaSound(sfxMumbaMenuConfirm, 100, .8);
			state=BOSS_IDLE_STATE;
			timer=-30;
		}
	break;
}

angle+=rollTurnSpeed*rollDirection;

if setSizeToHp {
	var b=.4,
	a=1-b;
	image_xscale=b+(lerp(0, a, hp/maximumHp));
	
	var ec=ds_list_size(eyes);
	for (var i=0; i<ec; i++) {
		var f=(i)/ec;
		if (hp/maximumHp)<f {
			with eyes[| i] {
				createMumbaParticle(x, y, mumbaDustParticle);
				instance_destroy();
			}
		}
	}
}

image_yscale=image_xscale;

waveMultiplier=lerp(waveMultiplier, 20, lerpRate);

for (var i=0; i<ds_list_size(eyes); i++) {
	with eyes[| i] {
		angle=offsetAngle+other.angle;
		x=other.x+lengthdir_x(offsetLength*other.image_xscale, angle);
		y=other.y+lengthdir_y(offsetLength*other.image_xscale, angle);
		angle=other.angle;
	}
}

drawShake=1;