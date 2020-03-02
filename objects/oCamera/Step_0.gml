/// @description Camera Update

// Update Destination
shake *= 0.9;

if(instance_exists(follow)){ //if(follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}

// Update Object Position //TODO: NEED A REVIEW
x += (xTo - x) / (global.GAME_FPS/3); 
y += (yTo - y) / (global.GAME_FPS/3);

// Not Go Over The room Border
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half/2);


// Update Camera View
camera_set_view_pos(cam, 
	max(0, min( room_width, x - view_w_half + random_range(-shake, shake))), 
	max(0, min( room_height, y - view_h_half + random_range(-shake, shake)))
);

instance_activate_all();
instance_deactivate_region(camera_get_view_x(cam), camera_get_view_y(cam), camera_get_view_width(cam), camera_get_view_height(cam), false, false);

//active important objects
arr = getActiveObjectOutsideCameraList();
for(var i=0; i< array_length_1d(arr); i++){
	instance_activate_object(arr[i]);
}

// active important layers
for(var i=0; i<array_length_1d(room.layer_whitelist);i++) {
	instance_activate_layer(room.layer_whitelist[i])
}