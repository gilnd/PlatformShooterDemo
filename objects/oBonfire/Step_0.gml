/// @description Insert description here
if(choose(true, false)){
	part = instance_create_layer(x+irandom_range(-4,+4), y+irandom_range(-2,-6), "DecorationsAbove", oSmokePart);
	part.direction = 90 + irandom_range(-25, 25);
	part.speed = random_range(0.5, 0.05);
	part.image_angle = direction;
}
if(choose(true, false)){
	Sfx = instance_create_layer(x+irandom_range(-4,+4), y+irandom_range(-2,-6), "DecorationsAbove", oSparkPart);
	Sfx.direction = 90 + irandom_range(-15, + 15);
	Sfx.speed = random_range(0.5, 0.05);
	Sfx.image_angle = direction;
	Sfx.image_blend = choose(c_red, c_orange);
	Sfx.makeSmoke = choose(false, true);
	Sfx.gravity = 0;
}
if(choose(true, false, false, false)){
	B = instance_create_depth(x,y-1,depth+1,oSfxSpark);
	B.direction = 90;//mean(90,90,mean(choose(0,180),random(360)));
	B.speed = random_range(3,6);
	B.dir = random_range(-90,90)/3;
	B.colour1 = choose(c_red,c_orange,c_yellow);
	B.colour2 = choose(c_red,c_orange,c_yellow);
	B.decrease = mean(1,random_range(0.65,0.95))/1.2;
}
if(choose(true, false, false, false)){
	C = instance_create_depth(x,y-1,depth+1,oSfxCircle);
	C.direction = 90;//mean(90,90,mean(choose(0,180),random(360)));
	C.speed = random_range(3, 6);
	C.dir = random_range(-90,90)/3;
	C.col1 = choose(c_red,c_orange,c_yellow);
	C.col2 = choose(c_red,c_orange,c_yellow);
	C.decrease = mean(1,random_range(0.65,0.95))/1.2;
}
