/// @description Insert description here
// You can write your code in this editor

if false {
if(!onDamageState && !onDodgeRoll){
	damage = irandom_range(1, 2);
	if((life-damage) < 0) {
		// todo
		life = 1;
	} else {
		life -= damage;
		rechargeLifeHit += damage;
	}
	
	onDamageState = true;
	flash = 6;
	
	// knockback..Porca Merda
	//y += -2; //sign(other.y - y) * konckback;
	x += sign(other.move) * (other.movespeed * 5.2) //* (other.knockback * 3);
	//vsp = -2; //sign((other.y + other.sprite_height/2) - y) * other.knockback;
	//hsp = sign(x-(other.x+(other.sprite_width/2))) * 2;
}

}