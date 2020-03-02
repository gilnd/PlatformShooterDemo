/// @description Increase Stamina & Life
if(stamina < staminaMax) stamina+=1;
else if (stamina > staminaMax) stamina = floor(stamina);

if(rechargeLifeHit > 0){
	
	life += 0.5;
	rechargeLifeHit --//= rechargeLifeHit/5;
	if(life + rechargeLifeHit > lifeMax)rechargeLifeHit = lifeMax - life;
	if(rechargeLifeHit<1)rechargeLifeHit=0;
	
} else {
	
	if(life < lifeMax) life+=0.1;
	else if (life > lifeMax) life = floor(life);
}

alarm[0] = 6 ;
