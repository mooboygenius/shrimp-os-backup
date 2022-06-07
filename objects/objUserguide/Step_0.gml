if live_call() return live_result;

event_inherited();



if(input(vk_right,PRESS) && !flipping){
	pagel=pageindex;
	pager=pageindex+1;
	
	pageindex+=2;
	
	pageln=pageindex;
	pagern=pageindex+1;
	
	flipping=1;
	flippingr=1;
	halfway=0;
}

if(input(vk_left,RELEASE) && !flipping){
	pagel=pageindex;
	pager=pageindex+1;
	
	pageindex-=2;
	
	pageln=pageindex;
	pagern=pageindex+1;
	
	flipping=1;
	flippingr=0;
	halfway=0;
}

if(pageindex<0){
	pageindex=0;
	flipping=0;
}
if(pageindex>=pages){
	pageindex=pages-2;
	flipping=0;
}

if(flipping){
	if(flippingr){
		if(!halfway){
			pagescale-=0.1;
			if(pagescale<=0){
				halfway=1;
			}
		}else{
			pagescale+=0.1;
			if(pagescale>=1){
				flipping=0;
			}
		}
	}else{
		if(!halfway){
			pagescale-=0.1;
			if(pagescale<=0){
				halfway=1;
			}
		}else{
			pagescale+=0.1;
			if(pagescale>=1){
				flipping=0;
			}
		}
	}
}

