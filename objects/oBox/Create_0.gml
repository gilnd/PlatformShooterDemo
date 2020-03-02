/// @description Insert description here
// You can write your code in this editor
image_speed=0;
image_angle = choose(0, 90, 180, 270);

image_index = irandom(image_number);

destructible = true;
life = irandom_range(2, 5);

grabbed = false;

originX = x;
originY = y;

isPlatform = false;
isMovableBox = true;
canWallJumpBlock = true;

// Define the points of the shadow caster
points = 4;
touched = false;
counter = 0;

hsp = 0;
vsp = 0;
grv = 1;