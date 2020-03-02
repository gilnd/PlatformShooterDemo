/// @description Rotation Cycle
if(dirCycle=="Left"){
	if(image_angle < maxAngle){
		image_angle+=random_range(0.02, 0.1);
	} else{
		dirCycle="Right";
	}
}
else {
	if(image_angle > minAngle){
		image_angle-=random_range(0.02, 0.1);
	} else{
		dirCycle="Left";
	}
}