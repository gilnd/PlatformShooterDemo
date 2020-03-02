/// @description Insert description here
/*
if(onDodgeRoll){
	onDodgeRoll = false;
	movespeed = movespeed/2;
	sprite_index = sPlayerIdle;
}
*/

x = onGroundx + (sign(onGroundx-x) * 8);
y = onGroundy;

damage = 10;
if((life-damage) < 0) {
	// todo
	life = 1;
} else {
	life -= damage;
	rechargeLifeHit += damage;
}
	
onDamageState = true;
flash = 6;
