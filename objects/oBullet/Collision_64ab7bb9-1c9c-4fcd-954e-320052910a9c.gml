/// @description Destroy & Bullet Sfx
if (other.destructible){
	scrBulletCollisionSfx();
	instance_destroy();
	other.life -= damage;
	/*
	with(other){
		apply_knockback(sign(other.hspeed) * other.h_knockback, other.v_knockback, true)
	}*/
} else if (!other.isPlatform){
	scrBulletCollisionSfx();
	instance_destroy();
}