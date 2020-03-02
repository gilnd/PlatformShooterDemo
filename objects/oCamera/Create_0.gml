/// @description Camera Init
shake=0;
zoom = global.settings[? "zoom"];
// Setting Up The View
target_view = 0; // which view to use
// or room_set_view_enabled(target_view, true);
view_enabled = true;

view_set_visible(target_view, true);

var res = global.settings[? "resolutionScale"];
var pos = string_pos("x", res);

if (pos != 0){
	w = real(string_copy(res, 1, pos-1));
	h = real(string_copy(res, pos+1, string_length(res))); 
} else {
	w = display_get_width();
	h = display_get_height();
}

view_set_wport(target_view, min(w, (room_width*zoom)));
view_set_hport(target_view, min(h, (room_height*zoom)));
window_set_size(w, h)

//window_set_position((display_get_width()/2) - (w/2) , (display_get_height()/2) - (h/2));
//window_set_fullscreen(global.settings[? "fullscreen"])
//window_center();

// Setting up the view
cam = view_camera[target_view];

//Follow Object
follow = oPlayer;
//with (oCamera) follow = oPlayer; //use this to change what camera follows

camera_set_view_size(cam, view_wport[target_view]/zoom, view_hport[target_view]/zoom);

//Resize and center
//window_set_rectangle((display_get_width() - view_wport[target_view]) * 0.5, (display_get_height() - view_hport[target_view]) *0.5 , view_wport[target_view], view_hport[target_view]);
if view_wport[target_view] != surface_get_width(application_surface) 
	|| view_hport[target_view] != surface_get_height(application_surface){
   surface_resize(application_surface, view_wport[target_view],view_hport[target_view]);
}
 
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.65;

xTo = xstart; // x
yTo = ystart; // y