/// @description Animate
if(!collideWithPlayer){
	#region Default Cycle
	if(incCycle){ 
		if(increase <= 1 ) increase+=random_range(0.02, 0.1);
		else incCycle = 0;
	}
	else {
		if(increase >= -1) increase-=random_range(0.02, 0.1);
		else incCycle = 1; 
	}
	#endregion
} else if (bounceCount > 0){
	#region Collision With Player
	if(incCycle){ 
		if(increase <= 5 ) increase+=0.2*bounceCount;
		else { 
			incCycle = 0; 
			bounceCount--;
		}
	}
	else {
		if(increase >= -5) increase-=0.2*bounceCount;
		else {
			incCycle = 1; 
			bounceCount--;
		}
	}
	
	if(bounceCount<2){
		collideWithPlayer=false;
	}
	#endregion
}
draw_sprite_skew_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1, increase, 0 );
