/// @description Insert description here
// You can write your code in this editor

event_inherited();

/*draw_set_alpha(0.5)
draw_set_color(c_red)
draw_sprite(sprite_index, image_index, x+hsp, y+hsp);
draw_set_color(c_white)*/
draw_set_alpha(1)

draw_set_color(c_white)
draw_text(x,y-32, format("{}\n{} - {}", state_name, distance_to_object(oPlayer), diffx));
/*var delta = sprite_height * (2/3)
var dir = reverse(sign(image_xscale))
draw_rectangle(x, y, x+(delta*dir), y+delta, true)*/
