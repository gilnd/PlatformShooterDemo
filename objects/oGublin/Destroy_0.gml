/// @description Insert description here
// You can write your code in this editor
event_inherited()
instance_destroy(weapon)

if chance(0.5) {
	instance_create_depth(x,y, depth, oTakeWeapon)
}