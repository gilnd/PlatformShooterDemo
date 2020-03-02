// @desc	:	Shaun's basic collision whit oBlock

// Maximum Vsp
if (vsp < 10) { vsp += grv; }

// Horizontal Check
if (place_meeting(x + hsp, y, oBlock)){
   while(!place_meeting(x + sign(hsp), y, oBlock)){
       x += sign(hsp);
   }
   hsp = 0;
}


// Vertical Check
if (place_meeting(x, y + vsp, oBlock)){
   y = sign(vsp) > 0 ? floor(y) : ceil(y)
   while(!place_meeting(x, y + sign(vsp), oBlock)){
       y += sign(vsp);
   }
   vsp = 0; 
}

// Effective Movment
y += vsp;
x += hsp;