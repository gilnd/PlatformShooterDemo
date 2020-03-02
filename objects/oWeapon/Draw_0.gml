/// @description Draw the weapon near the player

x = oPlayer.x - lengthdir_x(recoil, image_angle);
y = oPlayer.y - (oPlayer.sprite_height/2 - 2) - lengthdir_y(recoil, image_angle);

currentWeapon = weapons[currentWeaponIndicator];

#region Help Aiming

var xx = x + lengthdir_x(sprite_width, dir);
var yy = lengthdir_y(sprite_height, dir);
if (dir <= 90 || dir >= 270) { yy = yy + y;}
else { yy = y - yy; }


//DEBUG
//draw_text(x,y-48, "dir: " + string(dir) + " \n s_w: "+ string(sprite_width) + " \ns_h:" + string(sprite_height)
//	+"\n leng_x: " + string(xx) + "\n leng_y: " + string(yy));

// Help Aiming with Every Weapon?
draw_set_alpha(0.6);
draw_set_color(c_white);
draw_circle(xx + lengthdir_x(32, dir), yy + lengthdir_y(32, dir), 1.2, false);
draw_set_alpha(0.8);
draw_circle(xx + lengthdir_x(32, dir), yy + lengthdir_y(32, dir), 0.6, false);

#endregion
//BLUE FLAME
if(currentWeapon[? "id"] == 1 && key_shot_pressed > 0){
	var blueflameRangeAngle = currentWeapon[? "charge"];
	var blueflameMaxAngle = currentWeapon[? "max_charge"];
	
	var xx1 = xx + lengthdir_x(32, dir - blueflameRangeAngle); 
	var yy1 = yy + lengthdir_y(32, dir - blueflameRangeAngle);
	var xx2 = xx + lengthdir_x(32, dir + blueflameRangeAngle);
	var yy2 = yy + lengthdir_y(32, dir + blueflameRangeAngle);
	
	//geting charge in %
	var chargePercent = (blueflameRangeAngle / blueflameMaxAngle) * 100;
	
	draw_set_alpha(chargePercent/100);
	// draw_set_alpha(random_range(0.1, 0.6));
	
	gpu_set_blendmode(bm_add);
	
	draw_set_color(make_color_hsv(240, chargePercent, 100)); // blue to white
	//draw_set_color(merge_color(c_aqua,c_blue, 0.3));
	
	draw_lightning(xx,yy,xx1,yy1, 
		random_range(0.8, 1.2), random_range(3.8, 4.2), 
		random_range(0.8, 1.2), random_range(3.8, 4.2));
	draw_lightning(xx,yy,xx2,yy2, 
		random_range(0.8, 1.2), random_range(3.8, 4.2), 
		random_range(0.8, 1.2), random_range(3.8, 4.2));
	
	//draw_set_color(c_blue);
	//draw_set_alpha(0.8)
	
	draw_circle(xx, yy, 1, false)
	draw_circle(xx2, yy2, 1, false);	
	draw_circle(xx1, yy1, 1, false);
	gpu_set_blendmode(bm_normal);
	//Reset Draw Stuff
	draw_set_color(c_white);
	draw_set_alpha(1);
}

draw_self();