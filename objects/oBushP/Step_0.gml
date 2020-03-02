/// @description Insert description here
// You can write your code in this editor
if (!collide){
	if(place_meeting(x,y, oPlayer) or place_meeting(x,y, oBullet)){
		collide = true;
	} else { collide = false}
}