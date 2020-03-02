/// @description React To inpunt

// Get User Input
scrGetPlayerMoveInput();

var block = instance_place(x, bbox_bottom+1, oBlock);
// on Ground;
if (block == noone) {
	on_ground = false
} else {
	on_ground = true 
	//block.isPlatform ? bbox_bottom-1 <= block.bbox_top : true
}

// Moving the player
if(!onDamageState){
	if(!alarm[1]) { // basically check if the allarm is disabled (End DodgeRoll)
		move = -key_left + key_right;
		if move != 0 {
			image_xscale = move;
			hsp = clamp(hsp + (move * acc), -maxhsp, maxhsp);
		} else {
			hsp = approach(hsp, 0, acc*2)	
		}
		//hsp = move * movespeed;
	} else {
		// this way i block the player completing the roll anim/action
		hsp = tempMove * movespeed;
	} 
} 

 
if (on_ground) { 
	// Keep track of last block position
	// used when you fall outside of the room
	// if(block.isPlatform) onGroundy=y - sprite_height;
	// else onGroundy=y;
	onGroundy = y;
	onGroundx = x;
	
	// jump section
	if(key_up){
		//key_up *
		vsp = -jumpspeed;                // "-jumpspeed" because i need to go to -1 up(y) 
	}
	if (vsp < 0) audio_play_sound(choose(sndJump1, sndjump2, sndJump3), 1, false);
	
	// Dodge Roll
	if (key_space and !onDodgeRoll and stamina >= 20) {
		stamina -= 20;
		onDodgeRoll = true;
		tempMove = (move!=0) ? move : image_xscale;
		movespeed = movespeed*2;
		sprite_index = sPlayerDodgeRoll;
		alarm[1] = 30;
		audio_play_sound(choose(sndDodgeRoll, sndDodgeRoll2), 1, false);	
	}
}

goingdown = false
// fast fall
if key_down > 0 {
	vsp = clamp(vsp + 1.5, -maxvsp, maxvsp)
	goingdown = true
}


// verticall collision
var vblock = instance_place(x, y+vsp, oBlock)

if vblock != noone {
	if (sign(vsp) > 0) y = floor(y);
	else y = ceil(y);
	while instance_place(x, y+sign(vsp), oBlock) == noone
		y += sign(vsp);		
	vsp = 0
}
y += vsp

// horizontal collision
var hblock = instance_place(x+hsp, y, oBlock)

if hblock != noone {
	if (not hblock.isPlatform && hblock.canWallJumpBlock){		
		while instance_place(x+sign(hsp), y, oBlock) == noone
	        x += sign(hsp);

	    hsp = 0;
		if (vsp > 0 and stamina >= 1) {
			vsp = vsp/1.25
			stamina -= 0.5
			if (key_up and stamina >= 5){
				stamina -= 5;
				vsp = -jumpspeed; 
				audio_play_sound(choose(sndJump1, sndjump2, sndJump3), 1, false)
			} 
			if(stamina <= 1) canWallJump = false;
		}
		vsp = clamp(vsp + (grv*(2/3)), -maxvsp, maxvsp);
	} else {
		vsp = clamp(vsp + (grv*(2/3)), -maxvsp, maxvsp);
	} //else {}
	
} else { vsp = clamp(vsp + grv, -maxvsp, maxvsp);}

x += hsp
/*if place_meeting(x+hsp, y, oBlock){
	while !place_meeting(x+sign(hsp), y, oBlock) 
        x += sign(hsp);
		
    hsp = 0;
	if (vsp > 0 and stamina >= 1) {
		vsp = vsp/1.25
		stamina -= 0.5
		if (key_up and stamina >= 5){
			stamina -= 5;
			vsp = -jumpspeed; 
			audio_play_sound(choose(sndJump1, sndjump2, sndJump3), 1, false)
		//hsp = (key_left + -key_right) * (movespeed*2);  //Bullshit, but i'll come back to this shit one day
		} 
		if(stamina <= 1) canWallJump = false;
	}
	vsp = clamp(vsp + (grv*(2/3)), -maxvsp, maxvsp);
} else {
    x += hsp
	vsp = clamp(vsp + grv, -maxvsp, maxvsp);
}*/

if (on_ground) {
	if onDodgeRoll {
		#region SmokeSfx
		if(irandom(3)>1)  {
			repeat(irandom_range(0,3)){
				part = instance_create_layer(x, y, "DecorationsAbove", oSmokePart);
				part.direction = (image_xscale == -1) ? irandom_range(5,15) : irandom_range(175, 165);
				part.speed = random_range(0.2, 0.8);
				part.image_angle = irandom(360);
			}
		}
		#endregion
	} else {
		if (move != 0 && hblock==noone) {
			sprite_index = sPlayerRun; 
        
			#region SmokeSfx
			if((image_index >= 0 && image_index < 1) || (image_index >= 3 && image_index < 4))  {
				repeat(irandom_range(0,2)) {
					part = instance_create_layer(x, y, "DecorationsAbove", oSmokePart);
					part.direction = (image_xscale == -1) ? irandom_range(5,15) : irandom_range(175, 165);
					part.speed = random_range(0.2, 0.8);
					part.image_angle = irandom(360);
				}
			}
			#endregion
		} else { sprite_index = sPlayerIdle; }
	}
} else {
    if (vsp < 0) sprite_index = sPlayerJump; 
	else if(!onDodgeRoll) sprite_index = sPlayerFall;
}

// WallJump : Smoke on wall & Sprite
if (vsp > 0 && (place_meeting(get_bbox_x(), y, oBlock)) && !on_ground && stamina >= 1) {
	sprite_index = sPlayerOnWall;
	if(irandom(10)>=8) { 
		repeat(irandom_range(0,2)){
			part = instance_create_layer(x + (6*image_xscale), y - irandom_range(5,20), "DecorationsAbove", oSmokePart);
			part.direction = irandom_range(85,95)
			part.speed = random_range(0.2, 0.8);
			part.image_angle = irandom(360);
		}
	}
}

//slowing down the dodge rool cuz it needs more frames
image_speed = sprite_index == sPlayerDodgeRoll ? 0.5 : 1;

// Sound
#region sound
if(sprite_index == sPlayerRun){
	image_speed = abs(min(hsp/2, 1));
	footstepCount++;
	if(footstepCount == 6 || footstepCount==24) audio_play_sound(choose(sndWalk1, sndWalk2, sndWalk3, sndWalk4), 100, false);
	else if (footstepCount == 36) footstepCount = 1;
} else footstepCount = 1;
#endregion