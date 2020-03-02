var xx = x + lengthdir_x(oWeapon.sprite_width, dir);
var yy = lengthdir_y(oWeapon.sprite_height, dir);
if (dir <= 90 || dir >= 270) { yy = yy + y; } else { yy = y - yy; }

bullet = instance_create_layer(xx, yy , "DecorationsAbove", oBullet);
bullet.direction = dir + (irandom_range(-2, 2));
bullet.speed = 8.5;
bullet.image_angle = dir;
bullet.image_speed = global.GAME_FPS;
bullet.sprite_index = sMauserC96Bullet;
bullet.alarm[1] = irandom(3)+1;
bullet.col1 = c_lime;
bullet.col2 = c_gray;

// IMPORTANT
bullet.damage = irandom_range(9, 11);
bullet.knockback = 3;
audio_play_sound(choose(sndMauserC96Fire1, sndMauserC96Fire2, sndMauserC96Fire3, sndMauserC96Fire4), 1, false);

//Part
repeat(irandom(3)+1){
	var P = instance_create_layer(xx, yy, "DecorationsAbove", oSparkPart);
	P.direction = dir + irandom_range(-15, +15);
	P.speed = random_range(0.5, 2);
	P.image_angle = direction;
	P.image_blend = choose(c_lime, c_gray);
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
	B.colour1 = c_lime;
	B.colour2 = c_gray;
	B.decrease = mean(0.7,random_range(0.65,0.95))/random_range(1, 1.2);
}

if(choose(true, false, false, false)){
	var C = instance_create_layer(xx,yy,"DecorationsAbove",oSfxCircle);
	C.direction = mean(dir+(random_range(-15,15)/4),dir);
	C.speed = random_range(0.5,2.5)*1.5;
	C.dir = random_range(-40,40)/2;
	C.col1 = c_lime;
	C.col2 = c_gray;
	C.decrease = mean(1,random_range(0.65,0.95))/random_range(0.9, 1.2);
}