/// @description Destroy, Bullet Sfx & Other Flash

scrBulletCollisionSfx();

with(other) {
	if(object_get_name(object_index) != object_get_name(oPlayer)){
		life -= other.damage
	
		flash = 3;
		hitfrom	= other.direction
		apply_knockback(sign(other.hspeed) * other.h_knockback, other.v_knockback, true)
		
	} else {
		if(!onDamageState || (other.sprite_index != sPlayerDodgeRoll) ){
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
	
			apply_knockback(sign(other.hspeed) * other.h_knockback, other.v_knockback, true)
		}
	}
}

instance_destroy()