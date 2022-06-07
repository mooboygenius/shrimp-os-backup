if live_call() return live_result;

// Inherit the parent event
event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_sprite_tiled(sprGurubg, 0, 0, 12+scrollYLerp);
	
	var tx=10, ty=0+scrollYLerp;
	
	draw_set_color(BLACK_COLOR);
	draw_set_font(fntJerrod);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	var dx=160, dy=ty+10,
	dsep=14,
	dw=280,
	dt="jerrodsorelli.shrimp welcome to my website";
	draw_text_ext(dx, dy, dt, dsep, dw);
	
	dt="my name is jerrod sorelli this is me, nice to meet you,";
	draw_text_ext(tx+40, dy+20, dt, dsep, 100);
	
	dt="is there cadmium in YOUR water? don't click away. read more below";
	draw_text_ext(tx+250, dy+24, dt, dsep, 80);
	
	
	draw_sprite(sprGuruphoto, 0, tx+110, ty+25);
	
	dy=ty+120;
	dt="this me jerrod sorelli. welcome to the new best version of your shrimp state of mental mind iam jerrod sorelli";
	draw_text_ext(dx, dy, dt, dsep, dw);
	dy+=string_height_ext(dt, dsep, dw)+8;
	
	draw_sprite(sprGurupres, 0, tx+50, dy);
	
	dy+=125;
	
	dt="this is me at shrimpcon 1989 showing offmy software. hi "
	draw_text_ext(dx, dy, dt, dsep, dw);
	dy+=string_height_ext(dt, dsep, dw)+6;
	
	dt="my name is jerrod sorelli creator of the jerrod sorelli patented jerrod sorelli patented shrimp meditation software for the achievement of personal nirvana and a higher state of being.";
	draw_text_ext(dx, dy, dt, dsep, dw);
	dy+=string_height_ext(dt, dsep, dw)+8;
	
	dt="according to jerrod sorelli, there is a simple secret for accessing the secret limits of human potential and they all reside in one simple line of code. there is a little shrimp in the soul of all of us and it's simply waiting for you to get it out there and let it see the wonders of the world has to offer. "
	draw_text_ext(dx, dy, dt, dsep, dw);
	dy+=string_height_ext(dt, dsep, dw)+8;
	
	draw_sprite(sprGurucd, 0, tx+50, dy);
	
	with downloadButton {
		xstart=250+irandom_range(-10,0);
		ystart=dy+20+irandom_range(0,3);
	}
	
	dy+=106;
	
	dt="the patented jerrod sorelli shrimp software attunes itself to the positive (+) and negative (-) poles of the body through the fingers by shooting electrical patented 'jerrod sorelli particles' through the mouse connected to your computer and by achuieving a circuit throught hte body that connects itself to your computers it connects you more and more to the little shrimp in your heart, hello nice to meet you my name is jerrod sorelli and this is my shrimpsite.";
	draw_text_ext(dx, dy, dt, dsep, dw);
	dy+=string_height_ext(dt, dsep, dw)+3;
	
	draw_sprite(sprGurucurrent, 0, tx+50, dy);
	dt="dont be afraid. the data doesnt lie this will happen to you";
	draw_text_ext(tx+250, dy+24, dt, dsep, 80);
	dy+=90;
	
	dt="this shrimp is entranced in the aorta and observes what you observe through a little hole in yuor forehead (the third eye), the image is flipped (as so happens in the human eye) but the shrimp has no way of readjusting the image (leading to confusion, disoriented, does not understand) this stunts our day to day life and messes up our feelings in our day to day interaction with others."
	draw_text_ext(dx, dy, dt, dsep, dw);
	dy+=string_height_ext(dt, dsep, dw)+9;
	
	draw_sprite(sprGurudiagram, 0, tx+50, dy);
	dy+=109;
	
	dt="this one shrimple trick will leas to icnreased life expenctancy throughout your whole entire life. recommented usage is: every morning, after waking up, use software then browse the jerrod sorelli website, then";
	draw_text_ext(dx, dy, dt, dsep, dw);
	dy+=string_height_ext(dt, dsep, dw)+15;
	
	dt="site created and hosted for free at wwmy name is jerrod sorelli thank you for reading";
	draw_text_ext(dx, dy, dt, dsep, dw);
	dy+=string_height_ext(dt, dsep, dw)+3;
	
	draw_surface(childrenObjectSurf, 0, 0);
	
	draw_set_color(c_white);
	
	surface_reset_target();
}

scrollMinimum=-1000;