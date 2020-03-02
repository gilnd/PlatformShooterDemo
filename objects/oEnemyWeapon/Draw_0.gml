/// @description Draw the weapon near the player

x = anchor.x - lengthdir_x(recoil, image_angle);
y = anchor.y - anchor.sprite_height/2 - lengthdir_y(recoil, image_angle);

currentWeapon = weapons[currentWeaponIndicator];


/*draw_set_color(c_red)
draw_set_alpha(1)
 
var tx = get_bbox_x(oPlayer)
var ty = get_center_y(oPlayer)

tx += sign(get_bbox_x()) * 5
ty -= 5

draw_line(x, y, tx, ty)*/
//test stuff
/*
var xxtest = x + lengthdir_x(sprite_height + 64, image_angle);
var	yytest = y + lengthdir_y(sprite_width + 64, image_angle);
var xxtest2 = x + lengthdir_x(64, image_angle);
var	yytest2 = y + lengthdir_y(64, image_angle);

draw_text(x, y-32, "s_h: " + string(sprite_height) + "\ns_w: " + string(sprite_width) 
			+"\nxxt1: " + string(xxtest) + "  yyt1: " +string(yytest)
			+"\nxxt2: " + string(xxtest2) + " yyt2: " +string(yytest2)
);

draw_line_width(x,y,xxtest,yytest,4);
draw_set_color(c_green);
draw_line_width(x,y,xxtest2, yytest2,2);
*/

draw_self();
