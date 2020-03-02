/// scrBlueFlameFire(RangeAngle);
/// @param rangeAngle

if( argument0 >= 5 ) rangeAngle = argument0; else rangeAngle = 5;//Min
//rangeAngle = argument0;

var xx = x + lengthdir_x(oWeapon.sprite_width, dir);
var yy = lengthdir_y(oWeapon.sprite_height, dir);
if (dir <= 90 || dir >= 270) { yy = yy + y; } else { yy = y - yy; }

audio_play_sound(sndBlueFlameFire, 1, false);



bullet = instance_create_layer(xx, yy , "DecorationsAbove", oBullet);
bullet1 = instance_create_layer(xx, yy , "DecorationsAbove", oBullet);
bullet2 = instance_create_layer(xx, yy , "DecorationsAbove", oBullet);

bullet.direction = dir;
bullet.speed = 5;
bullet.image_angle = dir;
bullet.image_speed = 30;
bullet.sprite_index = sBlueFlameBullet;
bullet.col1 = c_blue;
bullet.col2 = make_color_rgb(91, 110, 225);
// IMPORTANT
bullet.damage = irandom_range(15, 18);
bullet.knockback = 3;


bullet1.direction = dir - rangeAngle;
bullet1.speed = 5.8;
bullet1.image_angle = dir;
bullet1.image_speed = global.GAME_FPS;
bullet1.sprite_index = sBlueFlameBullet;

if(rangeAngle>=15){
	bullet1.changeDirState=0;
	bullet1.angle=rangeAngle*2;
	bullet1.delay = rangeAngle/3;
	bullet1.alarm[2] = rangeAngle/3;
}

bullet1.col1 = c_blue;
bullet1.col2 = make_color_rgb(91, 110, 225);
// IMPORTANT
bullet1.damage = random_range(12, 15);
bullet1.knockback = 2;

bullet2.direction = dir + rangeAngle;
bullet2.speed = 5.8;
bullet2.image_angle = dir;
bullet2.image_speed = global.GAME_FPS;
bullet2.sprite_index = sBlueFlameBullet;

if(rangeAngle>=15){
	bullet2.changeDirState=1;
	bullet2.angle=rangeAngle*2;
	bullet2.delay = rangeAngle/3;	
	bullet2.alarm[2] = rangeAngle/3;
}

bullet2.col1 = c_blue;
bullet2.col2 = make_color_rgb(91, 110, 225);
// IMPORTANT
bullet2.damage = irandom_range(12, 15);
bullet2.knockback = 2;
	
//Smoke
repeat(irandom(2)+1){
	var S = instance_create_layer(xx, yy, "DecorationsAbove", oSmokePart);
	S.direction = dir + irandom_range(-rangeAngle, +rangeAngle);
	S.speed = random_range(0.5, 0.05);
	S.image_angle = direction;
}
//Part sfx
repeat(irandom(6)+3){
	var P = instance_create_layer(xx, yy, "DecorationsAbove", oSparkPart);
	P.direction = dir + irandom_range(-rangeAngle, +rangeAngle);
	P.speed = random_range(1, 2);
	P.image_angle = dir;
	P.image_blend = c_blue;
	P.decrease = 0.9;
	
}
//Spark
repeat(irandom_range(16,24)) {
	var B = instance_create_layer(xx,yy,"DecorationsAbove",oSfxSpark);
	B.direction = dir + irandom_range(-rangeAngle, +rangeAngle);
	//mean(dir+(random_range(-rangeAngle*3,rangeAngle*3)/4),dir);
	B.speed = random_range(0.5,3)*3.5;
	B.dir = random_range(-40,40)/2;
	B.colour1 = c_blue;
	B.colour2 = make_color_rgb(91, 110, 225);
	B.decrease = mean(0.7,random_range(0.65,0.95))/0.86;
	//B.moveZigZag = choose(true,false);
}

//Lightning
/*
repeat(irandom_range(4, 8)) {
	var L = instance_create_layer(xx,yy,"DecorationsAbove",oSfxLightning);
	L.direction = dir + irandom_range(-rangeAngle, +rangeAngle);
	//mean(dir+(random_range(-rangeAngle*3,rangeAngle*3)/4),dir);
	L.speed = random_range(0.5,3)*3.5;
	L.col1 = c_blue;
	L.col2 = make_color_rgb(91, 110, 225);
	L.decrease = mean(0.7,random_range(0.65,0.95))/0.88;
}
*/

//Circle
repeat (irandom_range(8, 16)) {
	var C = instance_create_layer(xx,yy,"DecorationsAbove",oSfxCircle);
	C.direction = dir + irandom_range(-rangeAngle, +rangeAngle);
	//mean(dir+(random_range(-rangeAngle*3,rangeAngle*3)/4),dir);
	C.speed = random_range(0.5,2.5)*1.5;
	C.dir = random_range(-40,40)/2;
	C.col1 = c_blue;
	C.col2 = make_color_rgb(91, 110, 225);
	C.decrease = mean(1,random_range(0.65,0.95))/1;
	C.outline = choose(true, false);
}