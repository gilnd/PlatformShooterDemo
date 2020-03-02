/// @description Insert description here

/*if(onCycle==false){
	minAngle=random_range(-10,0);
	maxAngle=random_range(10,0);
	onCycle = true;
	dir=1;
} else {
	if ( image_angle < maxAngle && dir == 1 ) { image_angle += 0.1; }
	else { dir = -dir}
	if ( image_angle > minAngle  && dir == -1) { image_angle -=1; }
	else { dir = -dir}
}

*/
if(instance_exists(oBush) and depth < oBush.depth) depth = oBush.depth+1;

if(dirCycle=="Left"){
	if(image_angle<5){
		image_angle+=random_range(0.02, 0.1);
	} else{
		dirCycle="Right";
	}
}
else {
	if(image_angle>-5){
		image_angle-=random_range(0.02, 0.1);
	} else{
		dirCycle="Left";
	}
}