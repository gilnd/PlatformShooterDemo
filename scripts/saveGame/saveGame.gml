// save()
// @argument0 : targetroom
// @argument1 : targetx
// @argument2 : targety
ini_open("save.ini")

targetRoom = argument0;
targetX = argument1;
targetY = argument2;

// Save Game / Checkpoint
ini_write_real("Game", "Room", targetRoom);

// Player 
ini_write_real("Player", "life", oPlayer.life);
ini_write_real("Player", "stamina", oPlayer.stamina);
ini_write_real("Player", "playerXpos", targetX);
ini_write_real("Player", "playerYpos", targetY);

// Weapons
ini_section_delete("Weapons")
var l = array_length_1d(oWeapon.weapons);
ini_write_real("Weapons", "length", l);
for (var i = 0; i < l; i++) {
	var w = oWeapon.weapons[i];
	ini_write_real("Weapons", format("weapon{}id", i), w[? "id"]);
	ini_write_real("Weapons", format("weapon{}global_ammo", i), w[? "global_ammo"]);
	ini_write_real("Weapons", format("weapon{}cartridge_ammo", i), w[? "cartridge_ammo"]);
}
ini_write_real("Weapons", "current", oWeapon.currentWeaponIndicator);

// Other
ini_close()
