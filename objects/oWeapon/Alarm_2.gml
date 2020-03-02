/// @description Reloading Weapons
currentWeapon = weapons[currentWeaponIndicator];
var ammoNeed = currentWeapon[? "cartridge"]- currentWeapon[? "cartridge_ammo"]; // Ammo needed to recharge full cartridge
if(currentWeapon[? "global_ammo"] > ammoNeed){
	currentWeapon[? "cartridge_ammo"] += ammoNeed;
	if (currentWeaponIndicator != 0) // RedHipster has Infinite ammo
		currentWeapon[? "global_ammo"] -= ammoNeed; 
} else {
	currentWeapon[? "cartridge_ammo"] += currentWeapon[? "global_ammo"];
	currentWeapon[? "global_ammo"] = 0;
}
charging=false;
