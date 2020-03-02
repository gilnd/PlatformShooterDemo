/// @description Get layers and backgrounds

layersName[0] = "value";
//layersDepth[0] = 0;

var a = layer_get_all();
var b = 0;
for (var i = 0; i < array_length_1d(a); i++;){
	l = layer_background_get_id(a[i])
	if(l != -1){
		layersName[b] = layer_get_name(a[i]);
		//layersDepth[b] = layer_get_depth(a[i]);
		b++;
	}
}