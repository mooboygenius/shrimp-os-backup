if live_call() return live_result;

event_inherited();

i+=objBimsymanager.gamespeed*0.1;
j+=objBimsymanager.gamespeed*0.12;
h+=objBimsymanager.gamespeed*0.04;

swayx=sin(i)*2;
swayy=cos(j)*2;
rot=sin(h)*8;

scale=lerp(scale,1,0.2);
