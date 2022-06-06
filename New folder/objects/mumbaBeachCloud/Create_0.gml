if live_call() return live_result;

event_inherited();

image_index=irandom(image_number);
var topSpeed=-.4,
recip=1/abs(topSpeed);
horizontalSpeed=random_range(-.1, topSpeed);
var ab=abs(horizontalSpeed);
cameraXMultiplier=ab*recip*.5;
var sizeLimit=.4;
image_xscale=random_range(.1, sizeLimit)+(ab*recip*(1-sizeLimit)*2);
image_yscale=image_xscale;
drawY-=ab*10*sprite_yoffset/2;