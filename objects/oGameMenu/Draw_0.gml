if(global.GAME_PAUSE){
	scrGetNavigationInput()
	//sound
	if(key_up!= 0 || key_down != 0){
		audio_play_sound(sndClick,1,false);
	}
	
	anim += -key_up +key_down;
	anim = clamp (anim, 0, array_length_1d(menu)-1)
	mpos = anim;
	anim_n = scrReachTween(anim_n, anim, 5);
	
	camX = camera_get_view_x(view_camera[oCamera.target_view]);
	camY = camera_get_view_y(view_camera[oCamera.target_view]);
	camWidth = camera_get_view_width(oCamera.cam);
	camHeight = camera_get_view_height(oCamera.cam)
	padding=8;

	

	draw_set_color(c_black);
	draw_set_alpha(0.8);
	draw_rectangle(0, 0, room_width, room_height, false);
		
	draw_set_font(fnt04b03);
	draw_set_alpha(1)
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_white);

	#region Inventory Top :: Weapons
	draw_set_color(c_white);
	draw_set_halign(fa_top);
	draw_set_valign(fa_left);
	draw_set_alpha(1);
	
	var weaponsArrayLengh = array_length_1d(oWeapon.weapons);
	draw_set_color(c_white);
	draw_rectangle(camX, camY, camX+camWidth, camY+64, false);
	
	var weaponsMenuHeight = camY + 64;
	
	for(var i = 0; i < weaponsArrayLengh; i++){ 
		var temp = oWeapon.weapons[i];
		var pos = camWidth/weaponsArrayLengh;
		draw_set_color(c_black);
		draw_text(camX+pos*i+16, camY+16, temp[? "name"]);
		draw_text(camX+pos*i+16, camY+24, string(temp[? "cartridge"]) + " / " + string(temp[? "max_ammo"]));
		draw_sprite(temp[? "sprite"], 0, camX+pos*i+24, camY+40);
	}
	#endregion
	
	#region Inventory Items
	var iniX = camX+camWidth-2, iniY = weaponsMenuHeight-2
	
	var inv = oPlayer.inventory
	
	for (var i=0; i<ds_list_size(inv); i++) {
		draw_set_color(c_gray)
		draw_set_alpha(0.9)
		var itm = inv[|i]
		var s = asset_get_index(itm[?"sprite"])
		
		var sw = sprite_get_width(s)
		var sh = sprite_get_height(s)
		draw_sprite(s, 0, iniX -(sw/2), iniY-sh);
		
		// draw_rectangle(iniX, iniY, iniX-sw, iniY-sh, true)
		iniX -= sw+1
	}
	#endregion

	#region quick menu
	var yCenter = (camHeight + weaponsMenuHeight + camY) / 2;
	for (var i=max(anim-1,0); i<min(anim+2, array_length_1d(menu)); i++){
		
		draw_set_color((i==anim)? c_red : c_ltgray);
		if(i==anim){ 
			draw_text(camX+camWidth/6 + lengthdir_x(20,(i-anim_n)*-28),
				yCenter + lengthdir_y(20,(i-anim_n)*-28), ">");
		}
		draw_text_transformed(
			camX+camWidth/6 + lengthdir_x(48,(i-anim_n)*-28),
			yCenter + lengthdir_y(48,(i-anim_n)*-28),
			menu[i],1,1, mean((i-anim_n)*-28, 0)
			);
		draw_set_color(c_white)
	}
	draw_set_alpha(1);
	draw_sprite(sPlayerIcon, 0, camX+camWidth/8, yCenter - (sprite_get_height(sPlayerIcon)/2));
	#endregion
	//RESET DRAW STUFF
	draw_set_color(c_white);
	draw_set_halign(fa_top);
	draw_set_valign(fa_left);
}

