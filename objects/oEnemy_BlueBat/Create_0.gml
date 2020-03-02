/// @description Enemy Start Stats
life = irandom_range(3, 5);

originX = x;
originY = y;
objectiveX = x + (irandom_range(-100, +100));
objectiveY = y + (irandom_range(-100, +100));


anchorY = 190;
frequency = 0.1;
amplitude = 10;
timer = 0;
whatAnchorY = anchorY;

//States
goingToOrigin = false;
goingAround = true;
lockedPlayer = false;