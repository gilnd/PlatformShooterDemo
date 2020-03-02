/// @description Weapon System

//questo perche loggetto si muovo solo se e visibile (draw event) nella x e y del player
//cosi facendo pero si salta uno step e rimane nel ultimo posto dove era prima di diventare
//nuovamente visibile...cosi facendo quando sparo..lo step legge la x e la y vecchie e crea il proiettile
//in quel punto...il che non va bene..quindi ecco spiegato sto schifo nello step che va messo perforza.

recoil = max(0, recoil-1); 

//TODO refactor?
if(currentWeaponIndicator == -1){
	visible = false;
	return;
} else {
	currentWeapon = weapons[currentWeaponIndicator]
}

if !visible {
	x = anchor.x - lengthdir_x(recoil, image_angle);
	y = anchor.y - anchor.sprite_height/2 - lengthdir_y(recoil, image_angle);
}

if should_shot and chance(angry) {

	key_shot = can_shoot_player(self, oGublin)

	currentWeapon = weapons[currentWeaponIndicator];

	if key_shot {	
		#region Direction
		var px = get_bbox_x(oPlayer, self)
		px -= sign(px) * 5
		var py = get_center_y(oPlayer)-3

		//irandom_range(oPlayer.bbox_left, oPlayer.bbox_right), irandom_range(oPlayer.bbox_bottom, oPlayer.bbox_top)
		dir = point_direction(x,y, px+irandom_range(-25,25), py+irandom_range(-25,25));


		image_angle = dir;
		direction = image_angle;	

		//todo check that
		if (image_angle > 90 && image_angle < 270) { image_yscale=-1}
		else { image_yscale = 1 }
		#endregion 
	
		alarm[0]=60;
		visible = true;
	
		if canShot and currentWeapon[? "cartridge_ammo"] > 0 and not charging {
			canShot=false;
			alarm[1] = currentWeapon[? "shot_t"];//fire rate
			currentWeapon[? "cartridge_ammo"]-=1;
	
			//Animation
			sprite_index = currentWeapon[? "sprite_shot"];
		    alarm[3] = floor(image_number);
			recoil = 2;
	
			//############################################################################
			//execute shot
			if(!currentWeapon[? "shot_on_release"])
				script_execute(currentWeapon[? "fire_script"]);//if this work...i dont know you all can like kiss my butt
			else script_execute(currentWeapon[? "fire_script"], blueflameRangeAngle+irandom_range(5,35));
		
		
		}
		blueflameRangeAngle=0;

	} 

	//charging
	if currentWeapon[? "global_ammo"] > 0 and not charging and currentWeapon[? "cartridge_ammo"] < 1{
		
		    //SO BASICALY THAT IF IS TRYING TO...to much long to explain 
		    //RELOAD WEAPON
		    charging=true;
		    alarm[2]=currentWeapon[? "charging_t"];
		
			//SFX this shit is always made up the player maybe try to create this up the enemy next time faggot
			//oChargingTemp = instance_create_layer(x,y,"DecorationsAbove",oCharging);;
			//oChargingTemp.image_speed = room_speed/currentWeapon[? "charging_t"];
			//oChargingTemp.image_blend = currentWeapon[? "primary_color"];//make_colour_hsv(255, 255, random(255));
	
	}
}