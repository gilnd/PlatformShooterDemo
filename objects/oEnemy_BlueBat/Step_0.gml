/// @description Insert description here


// what y i should fucking anchor porco dio?
if(goingAround) whatAnchorY = objectiveY;
else if (goingToOrigin) whatAnchorY = originY;
else if(lockedPlayer) whatAnchorY = oPlayer.y - oPlayer.sprite_height

//work on what anchor y
if(anchorY < whatAnchorY) anchorY += random_range(0.2, 1);
else if (anchorY > whatAnchorY) anchorY -= random_range(0.2, 1);

//App and down
y = anchorY + sin(timer*frequency)*amplitude;
timer++;

if (distance_to_object(oPlayer) < 96){
	lockedPlayer = true;
	goingToOrigin = false;
	goingAround = false;
	move_towards_point(oPlayer.x,oPlayer.y, random_range(1,1.4));
} else if (distance_to_point(originX,originY) < 264) {
	lockedPlayer = false;
	goingToOrigin = false;
	goingAround = true;
	if (distance_to_point(objectiveX, objectiveY) < 1){
		move_towards_point(objectiveX, objectiveY, random_range(1,1.4));
	} else {
		objectiveX = x + (irandom_range(-100, +100));
		objectiveY = y + (irandom_range(-100, +100));
	}
} else {
	lockedPlayer = false;
	goingToOrigin = true;
	goingAround = false;
	move_towards_point(originY,originX, random_range(1,1.4));
}

image_xscale = (hspeed > 1 || hspeed  < -1) ? -sign(hspeed) : 1;
