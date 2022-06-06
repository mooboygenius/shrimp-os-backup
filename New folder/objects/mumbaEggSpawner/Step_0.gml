if live_call() return live_result;

event_inherited();

if !instance_exists(mumbaLevelIntro) timer++;

if timer>30 {
	var a=0;
	while !instance_exists(mumbaEgg) && a<100 {
		a++;
		show_debug_message(concat("attempt #", a, " - no egg exists"));
	
		var p=48,
		left=p,
		right=left,
		top=p,
		bottom=top;
	
		with mumbaLevel {
			show_debug_message("BALLS BALLS SEX PUSSYT");
			right=tileSurfaceWidth-p;
			bottom=tileSurfaceHeight+p;
		}
	
		var potentialX=irandom_range(left, right) div 16 * 16+8;
	
		show_debug_message(concat("potential x: ", potentialX));
		
		with mumbaLevel {
			var b=0;
			while !instance_position(potentialX, bottom, mumbaWall) && b<100 {
				bottom-=16;
				b++;
			}
			
			bottom-=16;
			
			while !instance_position(potentialX, bottom, mumbaWall) && b<100 {
				bottom-=16;
				b++;
			}
			
			show_debug_message(concat("encountered lowest wall @ ", bottom));
			
			while instance_position(potentialX, bottom, mumbaWall) && b<100 {
				bottom-=16;
				b++;
			}
			
			if b>=100 {
				break;
			}
		}
	
		var potentialY=irandom_range(top, bottom);
		show_debug_message(concat("potential position: ", potentialX, ", ", potentialY));
		
		if !instance_position(potentialX, potentialY, mumbaWall) && point_distance(potentialX, potentialY, lastMumbaEggX, lastMumbaEggY)>96 {
			var c=0;
			while !instance_position(potentialX, potentialY+1, mumbaWall) && c<64 {
				potentialY++;
				c++;
			}
			show_debug_message("potential position is free, egg created...");
			setCameraShake(1);
			lastMumbaEggX=potentialX;
			lastMumbaEggY=potentialY;
			egg=instance_create_depth(potentialX, potentialY, -100, mumbaEgg);
			with egg {
				squish=.4;
				grace=10;
				while place_meeting(x, y+4, mumbaWall) y--;
			}
			with parentWindow {
				ds_list_insert(children, 0, other.egg);
			}
		} else {
			show_debug_message(concat("potential position @ ", potentialX, ", ", potentialY, " is occupied!! try again!!"));
		}
	}
}