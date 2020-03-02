/// @description Insert description here
// You can write your code in this editor

//if(increase < 3 && other.hsp > 0) increase += abs(other.hsp);
//else if ( increase > -3 && other.hsp < 0) increase -= abs(other.hsp);

if(!collideWithPlayer && other.hsp!= 0){
	collideWithPlayer = true;
	bounceCount = irandom_range(3,4);
	if(other.hsp > 0) incCycle = true;
	else incCycle = false;
}