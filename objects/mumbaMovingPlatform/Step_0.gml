if live_call() return live_result;

x=wave(left, right, moveTime, moveOffset);
y=wave(top, bottom, moveTime, moveOffset);

xstart=x;
ystart=y;

var p=4,
list=ds_list_create(),
instances=collision_rectangle_list(bbox_left-p, bbox_top-p*2, bbox_right+p, bbox_bottom+p, mumbaWorldObject, false, true, list, false);
for (var i=0; i<instances; i++) {
	with list[| i] {
		if canCollide {
			x+=(other.x-other.previousX);
			y+=(other.y-other.previousY);
			while place_meeting(x, y, mumbaWall) {
				y--;
			}
		}
	}
}
ds_list_destroy(list);

previousX=x;
previousY=y;

