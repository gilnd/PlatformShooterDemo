if h_knockback == 0 and v_knockback == 0 {
	hsp = vsp = 0
	behaviour_switch_previous(false)
	return
} else {
	hsp = h_knockback
	vsp = v_knockback
	h_knockback = approach(h_knockback, 0, 0.5)
	v_knockback = approach(v_knockback, 0, 0.5)
}


if (vsp < 10) { vsp += grv; }

//Horizontal Collisions
if (place_meeting(x + hsp, y, oBlock)){
	
   while(!place_meeting(x + sign(hsp), y, oBlock)){
       x += sign(hsp);
   }
   
   hsp = 0
   if stop_knockback_hitting_walls {
	h_knockback = 0
	v_knockback = 0
   }
   
}
x += hsp;

//Vertical collison
if (place_meeting(x, y + vsp, oBlock)){
   
   y = sign(vsp) > 0 ? floor(y) : ceil(y)
   
   while(!place_meeting(x, y + sign(vsp), oBlock)){
       y += sign(vsp);
   }
   vsp = 0 
	if stop_knockback_hitting_walls {
		v_knockback = 0
	}
}
y += vsp;