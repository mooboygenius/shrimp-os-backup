if live_call() return live_result;

event_inherited();

var list=ds_list_create(),
enemies=instance_place_list(x, y, mumbaEnemy, list, false);
for (var i=0; i<enemies; i++) {
	with list[| i] {
		var m=48,
		left=m,
		right=m;
		with mumbaLevel {
			right=tileSurfaceWidth-m;
		}
		
		if object_index==mumbaAngel {
			if (horizontalSpeed>0 && other.x>0) || (horizontalSpeed<0 && other.x<0) {
				anger+=.1;
				if anger<=.5 {
					moveSpeed*=1.15;
					horizontalSpeed*=1.15;
				}
				x=spawnX;
				y=spawnY;
			}
		} else if (other.x<left && x<other.x) || (other.x>right && x>other.x) && object_index!=mumbaGhost {
			if x<left {
				horizontalSpeed=moveSpeed;
			} else if x>right {
				horizontalSpeed=-moveSpeed;
			}
			anger+=.1;
			if anger<=.5 {
				moveSpeed*=1.15;
			}
			x=spawnX;
			y=spawnY;
		}
	}
}
ds_list_destroy(list);