if live_call() return live_result;

event_inherited();

var h=hour;
var m="AM";
if h>=12 m="PM";
h=h%12;
if h==0 h=12;
time=concat(timeFormat(h), ":", timeFormat(minute), " ", m);