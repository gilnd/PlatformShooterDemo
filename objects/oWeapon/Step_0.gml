/// @description Weapon System

recoil = max(0, recoil-1); 

if(currentWeaponIndicator == -1){
	visible = false;
	return;
} else {
	currentWeapon = weapons[currentWeaponIndicator]
}

if(!visible){
	x = oPlayer.x - lengthdir_x(recoil, image_angle);
	y = oPlayer.y - (oPlayer.sprite_height/2 - 2) - lengthdir_y(recoil, image_angle);
}

// Aiming & Input
scrGetWeaponsInput();

if(global.InputType == "Keyboard"){
	dir = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);
} else if (gamepad_is_connected(global.GamePadIndex)) {
	var h_point = gamepad_axis_value(global.GamePadIndex, gp_axisrh);
	var v_point = gamepad_axis_value(global.GamePadIndex, gp_axisrv);
	if ((abs(h_point) > 0) || (abs(v_point) > 0)){
		dir = point_direction(0, 0, h_point, v_point);
	}
}
image_angle = dir;
direction = image_angle;	

if (image_angle > 90 && image_angle < 270) { image_yscale=-1}
else { image_yscale = 1 }

if (key_change_weapon > 0) {
	var tempIndicator = currentWeaponIndicator+1;
	var len = array_length_1d(weapons)
	currentWeaponIndicator = tempIndicator < len ? tempIndicator : 0;
	alarm[3] = 1;
}

currentWeapon = weapons[currentWeaponIndicator];

if (key_shot > 0) {	
	alarm[0]=60;
	visible = true;
	if (!oPlayer.onDodgeRoll && canShot==true && currentWeapon[? "cartridge_ammo"] > 0 && charging==false ) {
		canShot=false;
		alarm[1] = currentWeapon[? "shot_t"];//fire rate
		currentWeapon[? "cartridge_ammo"]-=1;
	
		//Animation
		sprite_index = currentWeapon[? "sprite_shot"];
	    alarm[3] = floor(image_number);
		recoil = 2;
	
		//execute shot
		switch(currentWeapon[? "type"] == "C"){
			case 1: { // BLUE FLAME 
					script_execute(currentWeapon[? "fire_script"], max(0, currentWeapon[? "charge"]));
				} break;
			default : script_execute(currentWeapon[? "fire_script"]); break;
		}
		
		// Charge to 0
		if(currentWeapon[? "type"]=="C"){
			currentWeapon[? "charge"] = 0;
		}
	}
} else if (currentWeapon[? "type"]=="C" && key_shot_pressed > 0){
	visible = true;
	if(currentWeapon[? "charge"] < currentWeapon[? "max_charge"])
		currentWeapon[? "charge"] += currentWeapon[? "charge_increment"];
} else if ((
	(key_shot > 0 && canShot==true)
	|| (key_reload_weapon > 0 && currentWeapon[? "cartridge_ammo"] < currentWeapon[? "cartridge"])
	|| currentWeapon[? "cartridge_ammo"]<1)
	&& charging==false && currentWeapon[? "global_ammo"] > 0){
	
	
	// Reload Weapon
	charging=true;
	alarm[2]=currentWeapon[? "charging_t"];
		
	// Sfx
	oChargingTemp = instance_create_layer(x,y,"DecorationsAbove",oCharging);;
	oChargingTemp.image_speed = room_speed/currentWeapon[? "charging_t"];
	oChargingTemp.image_blend = currentWeapon[? "primary_color"];
}
	