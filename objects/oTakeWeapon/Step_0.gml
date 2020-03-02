/// @description Insert description here
sprite_index = weapon[? "sprite_take"]

if(can_interact) {
	
	scrGetPlayerEventInput();
	
	if (myDialog == noone) {
		myDialog = scrMessageBoxTakeWeapon(sprite_index, string(weapon[? "name"]), format("WOW! you found {}!", weapon[? "name"]), 1, x, oPlayer.y-(oPlayer.sprite_height*2), true);
	}
	
	#region Player interactions
	if(key_interact) {
		var len = array_length_1d(oWeapon.weapons)
	
		if(len < oWeapon.slots) { // add weapon to array 
			var place = len; // next free slot
			oWeapon.weapons[place] = ds_map_clone(weapon);
			oWeapon.currentWeaponIndicator = place;
			audio_play_sound(sndGotItem, 1 , false);
			instance_destroy(myDialog);
			myDialog = noone
			instance_destroy();
			
		} else { 
			//change current weapon with the found weapon
			var index = findWeapon(weapon[? "id"])
			
			if(index == -1) {
				// player has not that weapon 
				var place = oWeapon.currentWeaponIndicator == 0 ? oWeapon.currentWeaponIndicator + 1 : oWeapon.currentWeaponIndicator
				var old = oWeapon.weapons[place]
			
				oWeapon.weapons[place] = ds_map_clone(weapon);
				weapon = old
				oWeapon.currentWeaponIndicator = place;
			} else {
				var playerW = oWeapon.weapons[index]
				if playerW[? "global_ammo"] < playerW[? "max_ammo"] {
					playerW[? "global_ammo"] = playerW[? "max_ammo"]
	
					oWeapon.weapons[index] = playerW;
					oWeapon.currentWeaponIndicator = index;
				
					instance_destroy()
				}
			}
			oWeapon.alarm[3] = 1; // Update The Sprite
			instance_destroy(myDialog);
			myDialog = noone
		}	
	}
	#endregion
	
} else {
	instance_destroy(myDialog);
	myDialog = noone
}


#region Rotation Stuff
if(dirCycle=="Left"){
	if(image_angle < maxAngle){
		image_angle+=0.05;
	} else{
		dirCycle="Right";
	}
}
else {
	if(image_angle > minAngle){
		image_angle-=0.05;
	} else{
		dirCycle="Left";
	}
}
#endregion
//Sfx
/* 
B = instance_create_depth(x,y-1,depth+1,oSfxSpark);
B.direction = random(360);//mean(90,90,mean(choose(0,180),random(360)));
B.speed = random_range(0.5,3)*1.5;
B.dir = random_range(-90,90)/3;
B.colour1 = weapon[? "primary_color"];
B.colour2 = weapon[? "accent_color"];
B.decrease = mean(1,random_range(0.65,0.95))/1.2;
/*
C = instance_create_depth(x,y-1,depth+1,oSfxCircle);
C.direction = random_range(0,360);//mean(90,90,mean(choose(0,180),random(360)));
C.speed = random_range(0.5,2.5)*1.5;
C.dir = random_range(-90,90)/3;
C.col1 = weapon[? "primary_color"];
C.col2 = weapon[? "accent_color"];
C.decrease = mean(1,random_range(0.65,0.95))/1.2;

