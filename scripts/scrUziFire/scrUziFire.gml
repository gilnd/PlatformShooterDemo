var xx = x + lengthdir_x(oWeapon.sprite_width, dir);
var yy = lengthdir_y(oWeapon.sprite_height, dir);
if ( dir <= 90 || dir >= 270) { yy = yy + y; } else { yy = y - yy; }

bullet = instance_create_layer(xx, yy , "DecorationsAbove", oBullet);
bullet.direction = dir + (irandom_range(-5, 5));
bullet.speed = 10;
bullet.image_angle = dir;
bullet.image_speed = global.GAME_FPS;
bullet.sprite_index = sUziBullet;
bullet.alarm[1] = irandom(3)+1;
bullet.col1 = c_yellow;
bullet.col2 = make_color_rgb(225, 234, 153);
// IMPORTANT
bullet.damage = irandom_range(8, 10);
bullet.knockback = 1.5;

audio_play_sound(sndUziFire, 1, false);

//Part
repeat(irandom(3)+1){
	var P = instance_create_layer(xx, yy, "DecorationsAbove", oSparkPart);
	P.direction = dir + irandom_range(-15, +15);
	P.speed = random_range(0.5, 2);
	P.image_angle = direction;
	P.image_blend = choose(c_yellow, c_white);
	P.decrease = 0.9;
}
//Smoke
repeat(irandom(2)){
	var S = instance_create_layer(xx, yy, "DecorationsAbove", oSmokePart);
	S.direction = dir + irandom_range(-15, +15);
	S.speed = random_range(0.5, 0.05);
	S.image_angle = direction;
}

//Spark
repeat(irandom_range(3,6)) {
	var B = instance_create_layer(xx,yy,"DecorationsAbove",oSfxSpark);
	B.direction = mean(dir+(random_range(-15,15)/4),dir);
	B.speed = random_range(0.5,3)*3.5;
	B.dir = random_range(-40,40)/2;
	B.colour1 = c_yellow;
	B.colour2 = make_color_rgb(225, 234, 153);
	B.decrease = mean(0.7,random_range(0.65,0.95))/random_range(1, 1.2);
}

if(choose(true, false, false, false)){
	var C = instance_create_layer(xx,yy,"DecorationsAbove",oSfxCircle);
	C.direction = mean(dir+(random_range(-15,15)/4),dir);
	C.speed = random_range(0.5,2.5)*1.5;
	C.dir = random_range(-40,40)/2;
	C.col1 = c_yellow;
	C.col2 = make_color_rgb(225, 234, 153);
	C.decrease = mean(1,random_range(0.65,0.95))/random_range(0.9, 1.2);
}