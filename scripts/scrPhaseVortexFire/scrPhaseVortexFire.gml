var xx = x + lengthdir_x(oWeapon.sprite_width, dir);
var yy = lengthdir_y(oWeapon.sprite_height, dir);
if (dir <= 90 || dir >= 270) { yy = yy + y; } else { yy = y - yy; }

audio_play_sound(choose(sndRedHipsterFire1, sndRedHipsterFire2, sndRedHipsterFire3, sndRedHipsterFire4), 1, false);

// IMPORTANT
repeat(irandom_range(8,16)){
	var bullet = instance_create_layer(xx, yy , "DecorationsAbove", oBullet);
	bullet.direction = dir + (irandom_range(-32, 32));
	bullet.speed = 9;
	bullet.image_angle = dir;
	bullet.image_speed = global.GAME_FPS;
	bullet.sprite_index = sPhaseVortexBullet;
	bullet.alarm[0] = random_range(8, 16);
	bullet.alarm[1] = irandom(3)+1;
	
	bullet.damage = irandom_range(1, 4);
	bullet.knockback = 1;
	
	bullet.col1 = make_color_rgb(58,195,140);
	bullet.col2 = make_color_rgb(58,195,140);
}
//Smoke
repeat(irandom(2)+1){
	var S = instance_create_layer(xx, yy, "DecorationsAbove", oSmokePart);
	S.direction = dir + irandom_range(-15, +15);
	S.speed = random_range(0.5, 0.05);
	S.image_angle = direction;
}
//Part
repeat(irandom(6)+3){
	var P = instance_create_layer(xx, yy, "DecorationsAbove", oSparkPart);
	P.direction = dir + irandom_range(-15, +15);
	P.speed = random_range(1, 2);
	P.image_angle = dir;
	P.image_blend = c_aqua;
	P.decrease = 0.9;
}
//Spark
repeat(irandom_range(12,20)) {
	var B = instance_create_layer(xx,yy,"DecorationsAbove",oSfxSpark);
	B.direction = dir + irandom_range(-15, +15);
	//mean(dir+(random_range(-rangeAngle*3,rangeAngle*3)/4),dir);
	B.speed = random_range(0.5,3)*3.5;
	B.dir = random_range(-40,40)/2;
	B.colour1 = c_yellow;
	B.colour2 = make_color_rgb(58,195,140);
	B.decrease = mean(0.7,random_range(0.65,0.95))/0.86;
	//B.moveZigZag = choose(true,false);
}

//Circle
repeat (irandom_range(8, 16)) {
	var C = instance_create_layer(xx,yy,"DecorationsAbove",oSfxCircle);
	C.direction = dir + irandom_range(-15, +15);
	//mean(dir+(random_range(-rangeAngle*3,rangeAngle*3)/4),dir);
	C.speed = random_range(0.5,2.5)*1.5;
	C.dir = random_range(-40,40)/2;
	C.col1 = c_yellow;
	C.col2 = make_color_rgb(58,195,140);
	C.decrease = mean(1,random_range(0.65,0.95))/1;
	C.outline = choose(true, false);
}
