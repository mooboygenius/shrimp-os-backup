if live_call() return live_result;

event_inherited();

var h=current_hour,
m=current_minute,
d="AM";
if h>=12 d="PM";
h=h%12;
if h==0 h=12;
m=string_replace_all(string_format(m, 2, 0), " ", "0");
var month=current_month,
day=current_day,
year="99";
text=concat(h, ":", m, " ", d, "\n", month, "/", day, "/", year);