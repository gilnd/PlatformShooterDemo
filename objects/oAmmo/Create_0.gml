/// @description Init
event_inherited()

minAngle = random_range(-15, -5);
maxAngle = random_range(5, 15);

onCycle = false;
dirCycle = choose("Left", "Right");

image_angle=0;

outline_init();
myDialog = noone;

colRed = irandom(255);
colRedCycle = true;
colGreen = irandom(255);
colGreenCycle = true;
colBlue = irandom(255);
colBlueCycle = true;

ammo = irandom_range(10, 60)

//anim
t = 0;
increment = 6; //degrees -- freq = 1 oscillation per second (1Hz) in a 30 fps room
amplitude = 2; //pixels of peak oscillation
//clone the y-position (or use x instead if you're doing horizontal oscillation)
yy = y;