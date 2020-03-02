/// @description Insert description here
// You can write your code in this editor
if(hasgrav){
	if(vsp <= 2) vsp += grav;
	y+=vsp;
	if(direction != 270){
		if(direction < 90 || direction > 270) direction -= vsp;
		else direction += vsp;
	}
	image_angle = direction;
}
/*
if (angle>0){
	//(changeDirState==0) ? angle : -angle)
	t = (t + increment) mod 360;
	shift = amplitude * dsin(t);
 
	//clone the movement from the object's speed and direction
	xx += hspeed;
	yy += vspeed;
 
	//apply the shift
	x = xx + lengthdir_x(shift, direction + (changeDirState==0) ? angle : -angle);
	y = yy + lengthdir_y(shift, direction + (changeDirState==0) ? angle : -angle);
	
	image_angle = darctan(dcos(t));
}
*/