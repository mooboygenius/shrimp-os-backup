if live_call() return live_result;

event_inherited();

normalWaves=[
[mumbaCrab],
[mumbaCrab, mumbaCrab]
];

hardWaves=[
[mumbaCrab, mumbaCrab, mumbaCrab]
]

state=0;
spawnTimerMinimum=240;
spawnTimerMaximum=360;
spawner=noone;
spawnX=x;
spawnY=y;
currentSpawnArray=[];
hardWaveFrequency=6;
waveSize=0;
waves=0;
spawnIndex=0;
timer=180;
hardWaveChance=.1;
speedMultiplier=choose(-1, 1);

drawScript=function() {}