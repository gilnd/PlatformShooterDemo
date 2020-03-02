/// @description Insert description here
// You can write your code in this editor
draw_self() // draw the normal image

if (place_meeting(x, y, oPlayer)) { // This should be done in the step event but I've put it here to make the code cleaner 
	playerCanInteract = true;
	surface_player = surface_create(sprite_width, sprite_height)
	if (surface_exists(surface_player)) {
		surface_set_target(surface_player)
		
		draw_clear_alpha(c_black, 0);
		
		with(oPlayer) {
			if(oPlayer.x < x + (sprite_width/2)) offset = 8 else offset = -8;
			draw_sprite_ext(sprite_index,image_index,x - other.x + offset ,y-other.y//-8/*3*/
				,oPlayer.image_xscale, oPlayer.image_yscale, 0, c_white, 0.75)
		}
	
		gpu_set_blendmode(bm_subtract) // draw_set_blend_mode() in GM 1.4
		draw_sprite(sprite_index,subimage,0,0) // this has the image we want to blank out
		gpu_set_blendmode(bm_normal)

		surface_reset_target()
		draw_surface(surface_player,x,y)
		surface_free(surface_player)
	}
} else { 
	playerCanInteract = false;
}