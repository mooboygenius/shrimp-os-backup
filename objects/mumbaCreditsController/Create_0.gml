if live_call() return live_result;

event_inherited();

creditsText=ds_list_create();

circleTransition=noone;

moveSpeed=.6;
//moveSpeed=25;

var justUnlockedDeadEstate=loadData("deadEstateState", mumbaLevelState.unlocked)==mumbaLevelState.unlocked;

var sep=40/moveSpeed,
creditSep=sep*1.5,
nameSep=sep*2,
stsep=sep;
ds_list_add(creditsText,
"sprMumbaTitle", nameSep*2,
"Developed by\nMilkbar Lads", nameSep*2,

"- Jack -", creditSep,
"Programming", sep,
"Enemy Art", sep,
"Tile Art", sep,
"Background Art", sep,
"Weapon Art", sep,
"Hat Art", sep,
"Level Select Art", sep,
"Intro Art", sep,
"Sounds", nameSep,

"- Milkyace -", creditSep,
"Shopkeeper Art", sep,
"Credits Art", nameSep,

"- Stradomyre -", creditSep,
"Title Art", sep,
"Mumba Player Animations", nameSep,

"- Major -", creditSep,
"Music", nameSep*2,

"Additional thanks to HeyOPC\nfor the Ugby Mumba Rap", nameSep*2,

"Special thanks to these fellas", nameSep,

"Ayekerik", stsep,
"Linethickness", stsep,
"DogL", stsep,
"Shal", stsep,
"Droid", stsep,
"Nokoi", stsep,
"Goji", stsep,
"Hekdiggity", stsep,
"LeviRamirez", stsep);

ds_list_add(creditsText,
"Poptaffy", stsep,
"MZZA", stsep,
"BrandyBuizel", stsep,
"Zizou", stsep,
"Spicy", stsep,
"Ico", stsep,
"Gelox", stsep,
"ConnorGrail", stsep,
"Crashtroid", stsep,
"DefaultLabs", stsep,
"Dryest", stsep,
"Magibauble", stsep,
"Meulinex", stsep,
"PKToasty", stsep,
"Tyro", stsep,
"Tom Fulp", stsep,
"Corb Fucker", stsep,
"Norm Macdonald", nameSep,
"...and YOU!!", nameSep*2,
"The End", nameSep*3,
"...until Ugby Mumba 2", justUnlockedDeadEstate ? nameSep*3 : 300,
justUnlockedDeadEstate ? "Check level select\nfor a BONUS LEVEL!" : "", justUnlockedDeadEstate ? 300 : 0
);

timer=0;
current=0;
state=0;

drawScript=function(x, y) {}