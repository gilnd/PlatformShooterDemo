// @desc	:	generic bullet collision, creates sfx and play sound.
//				also shakes the camera.
oCamera.shake=1;

audio_play_sound(sndBulletColision, 1, false);
var tempdir = direction + 180 + irandom_range(-45, +45);

// Sfx: Particle
repeat(irandom_range(speed, mean(sprite_width, sprite_height))){
	part = instance_create_layer(x, y, "DecorationsAbove", oSparkPart);
	part.direction = tempdir;
	part.speed = random_range(0.05, 0.8);
	part.image_angle = direction;
	part.image_blend = col1;
	part.gravity = random_range(0.01, 0.03);
	part.decrease = 0.9;
}

// Sfx: Smoke
repeat(irandom_range(speed, mean(sprite_width, sprite_height))){
	smoke = instance_create_layer(x+irandom_range(-4,+4), y+irandom_range(-2,-6), "DecorationsAbove", oSmokePart);
	smoke.direction = tempdir;
	smoke.speed = random_range(0.5, 0.05);
	smoke.image_angle = direction;
}

// Sfx: Spark
repeat(irandom_range(speed, mean(sprite_width, sprite_height))){
	spark = instance_create_layer(x,y, "DecorationsAbove",oSfxSpark);
	spark.direction = mean(tempdir+(random_range(-90,90)/4),tempdir);
	spark.speed = random_range(0.5,3)*3.5;
	spark.dir = random_range(-40,40)/2;
	spark.colour1 = col1;
	spark.colour2 = col2;
	spark.decrease = mean(0.7,random_range(0.65,0.95))/1;
}

// Sfx: Circle Spark
repeat(irandom_range(speed/2, mean(sprite_width, sprite_height)/2)){
	cSpark = instance_create_layer(x,y-1, "DecorationsAbove", oSfxCircle);
	cSpark.direction = tempdir;
	cSpark.speed = random_range(0.5,2.5)*1.5;
	cSpark.dir = random_range(-40,40)/2;
	cSpark.col1 = col1;
	cSpark.col2 = col2;
	cSpark.decrease = mean(1,random_range(0.65,0.95))/1;
}