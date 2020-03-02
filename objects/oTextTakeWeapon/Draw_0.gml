/// @description 
#region Add letters over time
if (time < textLenght){
	time += spd;
	print = string_copy(text, 0, time);
}
#endregion

#region Render TextBox & Text
draw_set_alpha(alpha);
if (alpha < 0.8) alpha += spd/10 else alpha = 0.8;

draw_set_font(font);
draw_set_color(c_black);
draw_roundrect_ext(x, y, x+boxWidth, y+boxHeight, radius, radius, 0);
draw_triangle(x+(boxWidth/2)-4, y+boxHeight, x+(boxWidth/2)+4, y+boxHeight, x+(boxWidth/2)-4, y+boxHeight+8, false);

draw_set_halign(fa_center);
draw_set_valign(fa_top);

//Draw The Sprite
draw_sprite(weapSprite, 0, x+(boxWidth/2), y+padding+8);

//Draw Weap Title
draw_set_color(c_orange);
draw_text_transformed(x+(boxWidth/2),y + spriteHeight + padding, string(title), 1, 1, 0);


//Draw Text
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text_ext_transformed(
	x+padding,
	y+titleHeight+spriteHeight+padding+2,
	print,
	fontSize + (fontSize/2),
	maxLenght,
	1, 1, 0
)
#endregion

//draw the button
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_color(c_white);
draw_roundrect_ext(x + boxWidth -6, y + boxHeight-6, x + boxWidth + 2, y + boxHeight + 2, 3, 3, false);
draw_set_color(c_black)
draw_text(x + boxWidth-3, y + boxHeight-5, scrGetInputTypeDeviceChar());

//draw_roundrect_ext(x, y + boxHeight + 1, x + boxWidth - 8, y + boxHeight + 2, 2, 2, false); // Line
//draw_triangle(x+(boxWidth/2)-4, y+boxHeight+2, x+(boxWidth/2)+4, y+boxHeight+2, x+(boxWidth/2)-4, y+boxHeight+8, false);
//draw_sprite(sCanInteract, scrGetInputTypeDeviceIndex(), x-sprite_get_width(sCanInteract)/2 - 1, y + sprite_get_height(sCanInteract)/2 + 1);
//draw_sprite(sCanInteract, scrGetInputTypeDeviceIndex(), x+boxWidth, y+boxHeight);

draw_set_valign(fa_top);
draw_set_halign(fa_left);