 ///loadGlobalWeapons()
globalvar weapon_array;
//type = 1. NA > NotAutomatic
//		 2. A  > Automatic
//		 3. C  > Charge 

/* Default Weapon - RedHipster */
RedHipster = ds_map_create()
RedHipster[? "id"] = 0;
RedHipster[? "name"] = "RedHipster";
RedHipster[? "two_hand"] = false;
RedHipster[? "type"] = "NA";
RedHipster[? "sprite"] = sRedHipster;
RedHipster[? "sprite_shot"] = sRedHipsterFire;
RedHipster[? "sprite_take"] = sRedHipsterTake;
RedHipster[? "primary_color"] = c_red;
RedHipster[? "accent_color"] = make_colour_hsv(358, 55, 96);
RedHipster[? "shot_t"] = 16;
RedHipster[? "cartridge"] = 8;
RedHipster[? "cartridge_ammo"] = RedHipster[? "cartridge"];
RedHipster[? "max_ammo"] = 999; // Infinite
RedHipster[? "global_ammo"] = RedHipster[? "max_ammo"];
RedHipster[? "charging_t"] = 60;
RedHipster[? "fire_script"] = scrRedHipsterFire;

global.weapon_array[RedHipster[? "id"]] = RedHipster


/* Weapon - BlueFlame */
BlueFlame = ds_map_create();
BlueFlame[? "id"] = 1;
BlueFlame[? "name"] = "Blue Flame";
BlueFlame[? "two_hand"] = false;

BlueFlame[? "type"] = "C";
BlueFlame[? "charge"] = 0;
BlueFlame[? "charge_increment"] = 0.5;
BlueFlame[? "max_charge"] = 35;

BlueFlame[? "sprite"] = sBlueFlame;
BlueFlame[? "sprite_shot"] = sBlueFlameShot;
BlueFlame[? "sprite_take"] = sBlueFlameTake;
BlueFlame[? "primary_color"] = c_blue;
BlueFlame[? "accent_color"] = make_color_rgb(91, 110, 225);
BlueFlame[? "shot_t"] = 30;
BlueFlame[? "cartridge"] = 4;
BlueFlame[? "cartridge_ammo"] = BlueFlame[? "cartridge"];
BlueFlame[? "max_ammo"] = 30;
BlueFlame[? "global_ammo"] = BlueFlame[? "max_ammo"];
BlueFlame[? "charging_t"] = 90;
BlueFlame[? "fire_script"] = scrBlueFlameFire;

global.weapon_array[BlueFlame[? "id"]] = BlueFlame

/* Weapon - Uzi */
Uzi = ds_map_create();
Uzi[? "id"] = 2;
Uzi[? "name"] = "Uzi";
Uzi[? "two_hand"] = false;
Uzi[? "type"] = "A";
Uzi[? "sprite"] = sUzi;
Uzi[? "sprite_shot"] = sUziShot;
Uzi[? "sprite_take"] = sUziTake;
Uzi[? "primary_color"] = c_yellow;
Uzi[? "accent_color"] = make_color_rgb(225, 234, 153);
Uzi[? "shot_t"] = 8;
Uzi[? "cartridge"] = 18;
Uzi[? "cartridge_ammo"] = Uzi[? "cartridge"];
Uzi[? "max_ammo"] = 75;
Uzi[? "global_ammo"] = Uzi[? "max_ammo"];
Uzi[? "charging_t"] = 80;
Uzi[? "fire_script"] = scrUziFire;

global.weapon_array[Uzi[? "id"]] = Uzi;

/* Weapon - MauserC96 */
MauserC96 = ds_map_create();
MauserC96[? "id"] = 3;
MauserC96[? "name"] = "MauserC96";
MauserC96[? "two_hand"] = false;
MauserC96[? "type"] = "NA";
MauserC96[? "sprite"] = sMauserC96;
MauserC96[? "sprite_shot"] = sMauserC96Fire;
MauserC96[? "sprite_take"] = sMauserC96Take;
MauserC96[? "primary_color"] = c_lime;
MauserC96[? "accent_color"] = c_gray;
MauserC96[? "shot_t"] = 20;
MauserC96[? "cartridge"] = 12;
MauserC96[? "cartridge_ammo"] = MauserC96[? "cartridge"];
MauserC96[? "max_ammo"] = 44;
MauserC96[? "global_ammo"] = MauserC96[? "max_ammo"];
MauserC96[? "charging_t"] = 70;
MauserC96[? "fire_script"] = scrMauserC96Fire;

global.weapon_array[MauserC96[? "id"]] = MauserC96;

/* Weapon - RP46 */
RP46 = ds_map_create();
RP46[? "id"] = 4;
RP46[? "name"] = "RP46";
RP46[? "two_hand"] = false;
RP46[? "type"] = "A";
RP46[? "sprite"] = sRP46;
RP46[? "sprite_shot"] = sRP46Shot;
RP46[? "sprite_take"] = sRP46Take;
RP46[? "primary_color"] = c_red;
RP46[? "accent_color"] = make_color_rgb(244,111,116);
RP46[? "shot_t"] = 8;
RP46[? "cartridge"] = 28;
RP46[? "cartridge_ammo"] = RP46[? "cartridge"];
RP46[? "max_ammo"] = 140;
RP46[? "global_ammo"] = RP46[? "max_ammo"];
RP46[? "charging_t"] = 100;
RP46[? "fire_script"] = scrRP46Fire;

global.weapon_array[RP46[? "id"]] = RP46;

/* Weapon - PhaseVortex */
PhaseVortex = ds_map_create();
PhaseVortex[? "id"] = 5;
PhaseVortex[? "name"] = "Phase Vortex";
PhaseVortex[? "two_hand"] = true;
PhaseVortex[? "type"] = "NA";
PhaseVortex[? "sprite"] = sPhaseVortex;
PhaseVortex[? "sprite_shot"] = sPhaseVortexFire;
PhaseVortex[? "sprite_take"] = sPhaseVortexTake;
PhaseVortex[? "primary_color"] = c_green;
PhaseVortex[? "accent_color"] = c_lime;
PhaseVortex[? "shot_t"] = 20;
PhaseVortex[? "cartridge"] = 7;
PhaseVortex[? "cartridge_ammo"] = PhaseVortex[? "cartridge"];
PhaseVortex[? "max_ammo"] = 40;
PhaseVortex[? "global_ammo"] = PhaseVortex[? "max_ammo"];
PhaseVortex[? "charging_t"] = 80;
PhaseVortex[? "fire_script"] = scrPhaseVortexFire;

global.weapon_array[PhaseVortex[? "id"]] = PhaseVortex;