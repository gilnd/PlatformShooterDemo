/// @description Init Vars
image_speed = 0;
image_index = irandom(image_number);

minAngle = random_range(-8, -2);
maxAngle = random_range(2, 8);

onCycle = false;
dirCycle = choose("Left", "Right");

image_angle=0;



//alarm[0] = irandom_range(60, 120);