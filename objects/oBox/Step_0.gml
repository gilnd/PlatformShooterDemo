/// @description Insert description here

if (vsp < 8) { vsp += grv; }

if isMovableBox {
	if(place_meeting(x-1,y,oPlayer)){
		hsp = 1;
		repeat(irandom_range(0,1)){
			part = instance_create_layer(irandom_range(bbox_left, bbox_right), bbox_bottom, "DecorationsAbove", oSmokePart);
			part.direction = (image_xscale == -1) ? irandom_range(5,15) : irandom_range(175, 165);
			part.speed = random_range(0.2, 0.8);
			part.image_angle = irandom(360);
		}
	} else if(place_meeting(x+1,y,oPlayer)){
		hsp = -1;
		repeat(irandom_range(0,1)){
			part = instance_create_layer(irandom_range(bbox_left, bbox_right), bbox_bottom, "DecorationsAbove", oSmokePart);
			part.direction = (image_xscale == -1) ? irandom_range(5,15) : irandom_range(175, 165);
			part.speed = random_range(0.2, 0.8);
			part.image_angle = irandom(360);
		}
	
	} else {
		hsp = 0;
	}
}

// Horizontal collision
if (place_meeting(x + hsp, y, oBlock)){
	while(!place_meeting(x + sign(hsp), y, oBlock)){
       x += sign(hsp);
	}
	hsp = 0; 
}
x += hsp;

// Vertical collision 
if (place_meeting(x, y + vsp, oBlock)){
   while(!place_meeting(x, y + sign(vsp), oBlock)){
       y += sign(vsp);
   }
   vsp = 0;
}
y += vsp;

if(life <= 0){
	if(chance(0.05)){//5% chance 
		if(chance(0.5)) instance_create_layer(x, y, "Main", oAmmo);
		else instance_create_layer(x, y, "Main", oHealth);
	}
	instance_destroy();
	
}