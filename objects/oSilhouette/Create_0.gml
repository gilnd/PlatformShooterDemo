/// @description Create the surface
silhouetteSurface = surface_create( room_width, room_height); 
objects = ds_list_create();

// SCAN ALL THE OBJECT WITH A DEPTH BIGGER THAN PLAYER

playerDepth = oPlayer.depth;

with(all) {
	if(visible and depth < other.playerDepth and sprite_index != -1) {
		ds_list_add(other.objects, id)
	}
}


