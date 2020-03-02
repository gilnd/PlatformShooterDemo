/// @description Insert description here
// You can write your code in this editor
draw_self()
if flash > 0 {
	flash--;
	shader_set(shader_flash)
	draw_self()
	shader_reset()
} else {


onDamageState = false;
}


//draw_sprite(sKey, -1, room_width-sKey.sprite_width, room_height-sKey.sprite_height)

//draw_text(x,y-32, string(canWallJump));
//draw_set_color(c_white)
//draw_text(x,y-32, format("{}\n{}:{}",on_ground,vsp, hsp));
//draw_text(x, y-64, "vsp: " + string(vsp) + "\nhsp: "+ string(hsp));