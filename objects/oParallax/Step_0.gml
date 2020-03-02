/// @description lerp backgrounds
camX = camera_get_view_x(view_camera[oCamera.target_view]);//oCamera.target_view);

for (var i = 0; i < array_length_1d(layersName); i++;){
	layer_x(string(layersName[i]), lerp(0, camX, -((i>0)?(i+1)/40:1/6)));	
}