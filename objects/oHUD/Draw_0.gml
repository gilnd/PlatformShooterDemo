/// @description Draw Player HUD
if(oPlayer.stamina < oPlayer.staminaMax || oPlayer.onDamageState || oWeapon.visible || oWeapon.key_change_weapon>0){
	showHud = true;
	alarm[0] = 360;
}
if (showHud) {
	currentWeapon = oWeapon.weapons[oWeapon.currentWeaponIndicator];
	var viewX = camera_get_view_x(view_camera[0]);
	var viewY = camera_get_view_y(view_camera[0]);
	
	var camWidth = camera_get_view_width(view_camera[0])
	var camHeight = camera_get_view_height(view_camera[0])

	#region Player Bars
	/*
	draw_set_color(c_black);
	draw_set_alpha(0.6);
	draw_rectangle(viewX + margin -1, viewY + margin -1, viewX + margin + playerBarsWidth + 2, viewY + margin + staminabarHeight + lifebarHeight + spaceBetween , false);
	draw_set_alpha(1);
	*/
	//Stamina Draw
	draw_set_color(c_green);
	draw_rectangle(
		viewX+margin, 
		viewY+margin, 
		viewX+margin, 
		viewY+margin+staminabarHeight-1, false);
	draw_rectangle(
		viewX+margin+oPlayer.staminaMax+1, 
		viewY+margin, 
		viewX+margin+oPlayer.staminaMax+1, 
		viewY+margin+staminabarHeight-1, false);	
	draw_set_alpha(0.2);
	draw_rectangle(viewX+margin, viewY+margin, viewX+margin+oPlayer.staminaMax, viewY+margin+staminabarHeight-1, false);	
	draw_set_alpha(1);
	
	col = make_color_rgb(0,178,87);
	draw_rectangle_color(viewX + margin + spaceBetween, viewY + margin,
		viewX + margin + (spaceBetween*2) + oPlayer.stamina -(spaceBetween*2), viewY + margin + staminabarHeight-1,
		col, col, col, col, false
		);
	//rechargers
	if(oPlayer.stamina < oPlayer.staminaMax){
		draw_set_color(c_white);
		draw_rectangle(viewX+margin+oPlayer.stamina, viewY+margin, viewX+margin+oPlayer.stamina, viewY+margin+staminabarHeight-1, false);	
	}
	
	//Life Draw
	draw_set_color(make_color_rgb(158,11,15));
	draw_rectangle(
		viewX + margin, viewY + margin + staminabarHeight + spaceBetween, 
		viewX + margin, viewY + margin + staminabarHeight + spaceBetween + lifebarHeight -1, false);
	draw_rectangle( viewX + margin + oPlayer.lifeMax + 1, 
		viewY + margin + staminabarHeight + spaceBetween, 
		viewX + margin + oPlayer.lifeMax + 1, 
		viewY + margin + staminabarHeight + spaceBetween + lifebarHeight -1, false);	
	draw_set_alpha(0.2);
	draw_rectangle( 
		viewX + margin, viewY + margin + staminabarHeight + spaceBetween, 
		viewX + margin + oPlayer.lifeMax, viewY + margin + staminabarHeight + spaceBetween + lifebarHeight -1, false);	
	draw_set_alpha(1);
	
	col = c_red;//make_color_rgb(238,20,91);
	draw_rectangle_color(
		viewX + margin + spaceBetween, 
		viewY + margin + staminabarHeight + spaceBetween,
		viewX + margin + (spaceBetween*2) + oPlayer.life -(spaceBetween*2), 
		viewY + margin + staminabarHeight + spaceBetween + lifebarHeight -1,
		col, col, col, col, false
		);
	//Life Recharger
	if(oPlayer.life<oPlayer.lifeMax){
		draw_set_color(c_white);
		draw_rectangle(
			viewX + margin + oPlayer.life, 
			viewY + margin + staminabarHeight + spaceBetween, 
			viewX + margin + oPlayer.life + oPlayer.rechargeLifeHit, 
			viewY + margin + staminabarHeight + spaceBetween + lifebarHeight -1, false);	
	}
	#endregion

	//Weapon Draw
	//draw_sprite_ext(sWeaponIndicator, 0, viewX + margin, viewY + margin + spaceBetween + staminabarHeight,0,0,0,(currentWeapon[? "name"]=="RedHipster") ? c_red : c_white, 0 );
	draw_sprite(currentWeapon[? "sprite"], 0, 
		viewX + margin + floor(weaponBoxWidth/sprite_get_width(currentWeapon[? "sprite"])), 
		viewY + margin + playerBarsHeight + weaponBoxHeight/2);
	
	//Draw ## Ammo of the weapon
	if (oWeapon.charging == false ){
		for (i = 0; i < currentWeapon[? "cartridge_ammo"]; i++){
		    draw_sprite(sAmmoIndicator, 0, 
				viewX + margin + weaponBoxWidth + spaceBetween + i*3, 
				viewY + margin + playerBarsHeight);	
		}
		for(i=currentWeapon[? "cartridge"]-1; i >= currentWeapon[? "cartridge_ammo"]; i--){
			draw_sprite(sAmmoIndicator, 1, 
				viewX + margin + weaponBoxWidth + spaceBetween + i*3, 
				viewY + margin + playerBarsHeight);
		}
	}
	
	draw_set_font(fnt04b03);
	if(oWeapon.currentWeaponIndicator != 0){ // Not RedHipster
		var tempColor =  (currentWeapon[? "global_ammo"]) > 0 ? c_white : c_red; 
		draw_set_color(tempColor);
		draw_text( 
			viewX + margin + weaponBoxWidth + spaceBetween, 
			viewY + margin + playerBarsHeight + ammoIndicatorHeight, 
			string(currentWeapon[? "cartridge_ammo"]) + "#" + string(currentWeapon[? "global_ammo"]));
	} else {
		draw_set_color(c_white);
		var ammoStr = string(currentWeapon[? "cartridge_ammo"]) + "#"; 
		draw_text( 
			viewX + margin + weaponBoxWidth + spaceBetween, 
			viewY + margin + playerBarsHeight + ammoIndicatorHeight, 
			ammoStr);
		draw_sprite(sInfinite,0,
			viewX + margin + weaponBoxWidth + spaceBetween + string_width(ammoStr), 
			viewY + margin + playerBarsHeight + ammoIndicatorHeight);
	}
		
	draw_set_color(c_white); // Reset Draw Color
	var ammoStrHeight = string_height(string(currentWeapon[? "cartridge_ammo"]));
	for (var i=0; i < array_length_1d(oWeapon.weapons); i++){
		if ( i==oWeapon.currentWeaponIndicator ) draw_set_color(oWeapon.currentWeapon[? "primary_color"])
		else draw_set_color(c_white);
		draw_rectangle( viewX + margin + weaponBoxWidth + spaceBetween + i + i*3, 
		viewY + margin + playerBarsHeight + ammoIndicatorHeight + ammoStrHeight, 
		viewX + margin + weaponBoxWidth + spaceBetween + i+2 + i*3 ,
		viewY + margin + playerBarsHeight + ammoIndicatorHeight + ammoStrHeight + 2, 
		true);
		
		draw_rectangle( viewX + margin + weaponBoxWidth + spaceBetween + i + i*3 + 0.5, 
		viewY + margin + playerBarsHeight + ammoIndicatorHeight + ammoStrHeight + 0.5, 
		viewX + margin + weaponBoxWidth + spaceBetween + i+2 + i*3 -0.5,
		viewY + margin + playerBarsHeight + ammoIndicatorHeight + ammoStrHeight + 2 -0.5, 
		false);
	}
	//Empity Slots
	for (var i=0; i < oWeapon.slots; i++){
		if ( i==oWeapon.currentWeaponIndicator ) draw_set_color(oWeapon.currentWeapon[? "primary_color"])
		else draw_set_color(c_white);
		draw_rectangle( viewX + margin + weaponBoxWidth + spaceBetween + i + i*3, 
		viewY + margin + playerBarsHeight + ammoIndicatorHeight + ammoStrHeight, 
		viewX + margin + weaponBoxWidth + spaceBetween + i+2 + i*3 ,
		viewY + margin + playerBarsHeight + ammoIndicatorHeight + ammoStrHeight + 2, 
		true);
	}
}


	
	
	//



//USE THIS PORTION TO DEBUG THINGS ON SCREEN
//draw_text( viewX + 4, viewY + 32, global.InputController);
