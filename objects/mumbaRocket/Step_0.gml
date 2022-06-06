if live_call() return live_result;

event_inherited();

if chance(.1) verticalSpeed+=random_range(-1, 1)*.2;
horizontalSpeed=lerp(horizontalSpeed, sign(horizontalSpeed)*12, .05);

angle=point_direction(0, 0, horizontalSpeed, verticalSpeed);

if life%5==0 createMumbaParticle(x, y, mumbaDustParticle);

if life<=20 && life%4==0 grace=2;