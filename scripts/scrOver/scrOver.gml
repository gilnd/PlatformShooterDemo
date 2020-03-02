/// @description scrOver(objIDs)
/// @param objIDs
//TODO NEED TO FIX THIS PLIS
//var temp; 

var temp = false;
var i = 0;
do {
	//show_debug_message(argument[i])
	
	obj = argument[i]; 
	if(instance_exists(obj)){
		temp = (obj.x >= bbox_left &&
			obj.x <= bbox_right &&
		    obj.y >= bbox_top &&
		    obj.y <= bbox_bottom);
	}
	
	i++;
} until (!temp or i < argument_count);

return temp;


/*
if(instance_exists(argument0))
{
	return (argument0.x >= bbox_left &&
				argument0.x <= bbox_right &&
			    argument0.y >= bbox_top &&
			    argument0.y <= bbox_bottom);
} else return false;

*/
