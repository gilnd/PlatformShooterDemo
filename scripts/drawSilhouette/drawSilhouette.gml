///draw_silhouette();

surface_set_target(silhouetteSurface);

//make the surface black
draw_clear(c_black);

//draw_the player_ white
shader_set(shSilhouette); 
with (oPlayer) { 
	draw_self(); 
}
shader_reset();

//draw the tree black with alpha 0.5

for(var i=0; i < ds_list_size(objects); i++){
	with(ds_list_find_value(objects, i)) {
		// WHE SHOULD DO A LIST OF EXLUDED OBJECTS (LIKE LEAFPIC) Where the silhouette isnt used
		if(sprite_index!= sPlants and sprite_index!= sGrass){
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_gray, 0.5);
		}
		/* //NON SO SE LACIARLO O TOGLIERLO IN REALTA NON E MOLTO FIGO DA VEDERE SULL ERBA/FIORI
		if(sprite_index == sGrass)
			draw_sprite_skew_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_gray, 0.5, increase, 0 );
		else
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_gray, 0.5);
		*/
	}
}

surface_reset_target();

//draw the surface

shader_set(shSilhouetteRemoveSurface);
draw_surface(silhouetteSurface, 0, 0);
shader_reset();
