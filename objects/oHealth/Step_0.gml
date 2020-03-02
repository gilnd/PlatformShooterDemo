/// @description 
if(can_interact){
	scrGetPlayerEventInput();
	if (myDialog == noone){
		if (oPlayer.life < oPlayer.lifeMax)
			myDialog = scrMessageBox("Health Pack!", format("Restores full life!"), 1, x, oPlayer.y-oPlayer.sprite_height, true);
		else
			myDialog = scrMessageBox("Health Pack!", format("Already full life! "), 1, x, oPlayer.y-oPlayer.sprite_height, true);
	}
	if(key_interact){			
			if (oPlayer.life < oPlayer.lifeMax) {
				oPlayer.life = oPlayer.lifeMax;
				//effects
				oPlayer.flash = 3;
				repeat(irandom_range(6, 12)){
					createSparkAndCircleFX( 
						random(360), random_range(0.5,3)*1.5, 
						random_range(-90,90)/3, c_white, c_red, 
						mean(1,random_range(0.65,0.95))/1.2
					);
				}
				instance_destroy();
				audio_play_sound(sndGotItem,1,false);
			}
			instance_destroy(myDialog);
			myDialog = noone
	}
} else {
	instance_destroy(myDialog);
	myDialog = noone
}

#region UpDown
t = (t + increment) mod 360;
shift = amplitude * dsin(t);
//clone the movement from the object's speed and direction
yy += vspeed;
y = yy + shift; //vertical wave motion
#endregion

#region Rotation Stuff
if(dirCycle=="Left"){
	if(image_angle < maxAngle){
		image_angle+=0.2;
	} else{
		dirCycle="Right";
	}
}
else {
	if(image_angle > minAngle){
		image_angle-=0.2;
	} else{
		dirCycle="Left";
	}
}
#endregion
//Sfx
/* 
createSparkAndCircleFX( 
	random(360), random_range(0.5,3)*1.5, 
	random_range(-90,90)/3, c_white, c_red, 
	mean(1,random_range(0.65,0.95))/1.2
);
*/