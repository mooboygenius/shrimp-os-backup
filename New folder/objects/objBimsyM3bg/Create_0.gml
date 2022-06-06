if live_call() return live_result;

event_inherited();

complete=0; 

menux=-100;
witchx=100;

dial="welcome!";

money=irandom_range(2,8);
item=irandom_range(0,1);
itemspr=irandom_range(0,4);
if(objBimsymanager.shrimpmode){
	itemspr=5;	
}

itemdescs=["",""];
switch(irandom_range(0,2)){
	case 0: itemdescs[!item]="Just some crud..."; break;
	case 1: itemdescs[!item]="This sucks..."; break;
	case 2: itemdescs[!item]="Erm, what the..?"; break;
}
itemnames=["",""];
switch(irandom_range(0,2)){
	case 0: itemnames[!item]="crud"; break;
	case 1: itemnames[!item]="crap"; break;
	case 2: itemnames[!item]="turd"; break;
}

prices=["$99999","$99999"];

itemsprs=[0,0];
itemsprs[!item]=irandom_range(0,2);

colours=[0,1];
colours[0]=$452fad;
colours[1]=$452fad; //why do I have to do it like this what the fuck

textcol=[0,0];
textcol[0]=$e8fff5;
textcol[1]=$e8fff5;

pricecol=[0,0];
pricecol[0]=$7752ff;
pricecol[1]=$7752ff;

scales=[1,1];

sprites=[sprBimsyDeadestatepoop,sprBimsyDeadestatepoop];
sprites[item]=sprBimsyDeadestateitems;

switch(itemspr){
	case 0: itemdescs[item]="tasty stuff!"; itemnames[item]="s.ramen"; break;
	case 1: itemdescs[item]="shrimp is better."; itemnames[item]="b.ramen"; break;
	case 2: itemdescs[item]="ah, sandals!"; itemnames[item]="sandals"; break;
	case 3: itemdescs[item]="need a map?"; itemnames[item]="map"; break;
	case 4: itemdescs[item]="chocolatey!"; itemnames[item]="choco"; break;
	case 5: itemdescs[item]="shrimple as that."; itemnames[item]="shrimp"; break;
}
itemsprs[item]=itemspr;
colours[item]=$83eeff;
prices[item]="$"+string(money);

updatetext=0;


menupos=0;

drawScript=function(x,y){
	draw_sprite(sprBimsyDeadestatebg,0,0,0);
	draw_sprite(sprBimsyDeadestatewitch,0,witchx,0);
	draw_sprite(sprBimsyDeadestatesidebar,0,menux,0);
	draw_set_font(fntBimTiny);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	bimoutlinetext(18+menux,18,"You have $"+string(money)+"...",$e8fff5,$211f1b);
	
	for(var i=0; i<2; i++){
		draw_sprite_ext(sprites[i],itemsprs[i],25+i,37+i*20,scales[i],1,0,-1,1);
		bimoutlinetext(33+menux+i,33+i*20,itemnames[i],textcol[i],$211f1b);
		bimoutlinetext(33+menux+i,41+i*20,prices[i],pricecol[i],$211f1b);
	}
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	bimoutlinetext(64+menux,103,dial,$e8fff5,$211f1b);
}
