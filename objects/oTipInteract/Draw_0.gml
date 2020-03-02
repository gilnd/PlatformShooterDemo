/// @description Insert description here
anim += 4;
x=oPlayer.x;
y=oPlayer.y-32 + sinOscillate(-2, 2, anim)

draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_color(c_white);
draw_roundrect_ext(x-4, y, x + 4, y + 8, 3, 3, false);
draw_set_color(c_black)
draw_text(x-1, y+1, scrGetInputTypeDeviceChar());
