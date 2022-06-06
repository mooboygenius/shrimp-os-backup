if live_call() return live_result;

event_inherited();

var moveAngle=point_direction(0, 0, horizontalSpeed, verticalSpeed),
moveSpeed=point_distance(0, 0, horizontalSpeed, verticalSpeed);
moveAngle+=5;
horizontalSpeed=lengthdir_x(moveSpeed, moveAngle);
verticalSpeed=lengthdir_y(moveSpeed, moveAngle);

var w=wave(1, 1.5, 1);
xScale=lerp(xScale, w, .5);
yScale=xScale;

var l=.02;
horizontalSpeed=lerp(horizontalSpeed, 0, l);
verticalSpeed=lerp(verticalSpeed, 0, l);

angle=wave(-1, 1, .5)*30;