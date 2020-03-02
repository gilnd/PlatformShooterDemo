/// @description Insert description here
// You can write your code in this editor
if(!onDamageState){
	damage = other.damage + irandom_range(-1, 2);//Exstra damage
	if((life-damage) < 0) {
		// todo
		life = 1;
	} else {
		life -= damage;
		rechargeLifeHit += damage;
	}
	
	onDamageState = true;
	flash = 6;
	
	apply_knockback(reverse(sign(image_xscale)) * other.h_knockback, negative(other.v_knockback), false)
}