/// @description Draw the surface
if (!surface_exists(silhouetteSurface)){
	silhouetteSurface = surface_create(room_width, room_height);	
} 


drawSilhouette();
