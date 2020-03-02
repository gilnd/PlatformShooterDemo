// @params(x1,y1,radius,obj,prec,notme)
//
//  Returns a list data structure populated with the ids of instances 
//  colliding with a given circle, or noone if no instances found.
//
//      x1,y1       center of the collision circle (filled), real
//      radius      radius of the collision circle (filled), real
//      obj         object to check for collision (or all), real
//      prec        true for precise collision checking, bool
//      notme       true to ignore the calling instance, bool
//
/// GMLscripts.com/license
{
    var x1,y1,radius,obj,prec,notme,dsid,i;
    x1 = argument0;
    y1 = argument1;
    radius = argument2;
    obj = argument3;
    prec = argument4;
    notme = argument5;
    dsid = ds_list_create();
    with (obj) {
        if (!notme || id != other.id) {
			//point_in_circle(mouse_x, mouse_y, x, y, 16)
            //i = collision_circle(x1,y1,radius,id,prec,false);
            //if (i != noone) ds_list_add(dsid,i);
			if point_in_circle(x, y, x1,y1, radius) or true {
				ds_list_add(dsid, id);
			}
        }
    }
    if (ds_list_empty(dsid)) {
        ds_list_destroy(dsid);
        dsid = noone;
    }
    return dsid;
}