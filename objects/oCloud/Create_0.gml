/// @description Init CLouds

image_speed = 0;
image_index = irandom(image_number);

direction = 180;

speed = random_range(0.5, 0.01);

//scale = random_range(0.5,5);
//image_yscale = scale;
//image_xscale = scale;
image_xscale = choose(-1, 1);

y = y + irandom_range(-64,64);