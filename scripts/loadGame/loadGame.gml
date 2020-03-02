// loadGame()
saveFile = false;
if file_exists("save.ini"){
	saveFile = true;
	ini_open("save.ini")
	// Load Game / checkpoint
	checkpointRoom = ini_read_real("Game", "Room", 1);
	// Player
	if(instance_exists(oPlayer)){
		oPlayer.life = ini_read_real("Player", "life", oPlayer.lifeMax);
		oPlayer.stamina = ini_read_real("Player", "stamina", oPlayer.staminaMax);
		oPlayer.x = ini_read_real("Player", "playerXpos", 0);
		oPlayer.y = ini_read_real("Player", "playerYpos", 0);
	}
	#region Weapons
	if(instance_exists(oWeapon)){
		nWeapons = ini_read_real("Weapons", "length", -1)
		if(nWeapons == -1) { // player has no weapons
			oWeapon.weapons[0] = ds_map_clone(global.weapon_array[0])
			oWeapon.currentWeaponIndicator = 0
		} else { //restore wepons
			var globLen = array_length_1d(global.weapon_array)
			for (var i = 0; i < nWeapons; i++) {
				var idWeap = ini_read_real("Weapons", format("weapon{}id", i), -1)
				if(idWeap != -1 && idWeap < globLen) {
					var w = ds_map_clone(global.weapon_array[idWeap])
					var tmp = ini_read_real("Weapons", format("weapon{}global_ammo", i), -1)
					if(tmp != -1) {
						w[? "global_ammo"] = tmp;
					}
					tmp = ini_read_real("Weapons", format("weapon{}cartridge_ammo", i), -1)
					if(tmp != -1) {
						w[? "cartridge_ammo"] = tmp;
					}
					oWeapon.weapons[i] = w
				}
			}
			oWeapon.currentWeaponIndicator = ini_read_real("Weapons", "current", nWeapons >= 0 ? 0 : -1)
		}
	}
	#endregion
	
	#region Inventory
	
	loadInvetory()
	
	#endregion
	
	
	
	ini_close();
} else { 
	// defualt
	saveFile = false; 
	if(instance_exists(oPlayer)){
		oPlayer.life = oPlayer.lifeMax;
		oPlayer.stamina = oPlayer.staminaMax;
	}
	if(instance_exists(oWeapon)){
		oWeapon.weapons[0] = ds_map_clone(global.weapon_array[0])
		oWeapon.currentWeaponIndicator = 0
	}
}