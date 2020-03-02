/// @description gravity

// Gravity
if (vsp < 10) { vsp += grav; }

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
   hsp = 0
}
y += vsp;
