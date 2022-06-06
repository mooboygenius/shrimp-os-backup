if live_call() return live_result;

event_inherited();
//show_debug_message(object_get_name(object_index));
weight=.05;
var ppx=x, ppy=y, px=0, py=0,
vsp=0

with owner {
	vsp=verticalSpeed+verticalKnockback;
	if place_meeting(x, y, mumbaHat) {
		other.squish=squish;
		other.xScale=xScale;
		other.yScale=yScale;
	}
	ppx=x+horizontalSpeed;
	ppy=y-sprite_yoffset+verticalSpeed;
	
	var i=ceil(image_index)-1;
	
	switch sprite_index {
		case sprMumba:
			switch i {
				case 0:
					px+=1;
				break;
			
				case 1:
					//
				break;
			
				case 2:
					px+=2;
				break;
			
				case 3:
					px+=3;
					py+=3;
				break;
			
				case 4:
					px+=2;
					py+=2;
				break;
			}
		break;
		
		case sprMumbaWalk:
			py-=1;
			switch i {
				case 0:
					py+=2;
				break;
				
				case 1:
					py+=5;
					px+=2;
				break;
				
				case 2:
					//
				break;
				
				case 3:
					py+=2;
				break;
				
				case 4:
					py+=5;
					px+=2;
				break;
				
				case 5:
				break;
			}
		break;
		
		case sprMumbaDeath:
			switch i {
				case 0:
					py+=3;
				break;
				
				case 1:
					py+=1;
				break;
				
				case 2:
					py+=5;
				break;
				
				case 3:
					py+=7;
				break;
				
				case 4:
					//
				break;
				
				case 5:
					//
				break;
				
				case 6:
					py+=1;
				break;
				
				case 7:
					py+=7;
				break;
				
				case 8:
					py+=14;
				break;
				
				case 9:
					py+=12;
				break;
				
				case 10:
					py+=12;
				break;
			}
		break;
		
		case sprMumbaDead:
			py+=12;
		break;
	}
}
ppy+=(py+yOffset)*sign(yScale);
ppx+=(px+xOffset)*sign(xScale);

x=ppx;
y+=verticalSpeed;
if y>=ppy || attachToPlayer || (vsp<.5 && point_distance(x, y, ppx, ppy)<4) {
	verticalSpeed=0;
	y=ppy;
	angle=0;
} else if verticalSpeed>1 {
	angle=lerp(angle, wave(-1, 1, 2)*50, .05);
}

verticalSpeed=min(verticalSpeed, 2);

if !instance_exists(owner) instance_destroy();