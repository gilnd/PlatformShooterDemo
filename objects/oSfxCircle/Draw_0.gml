gpu_set_blendmode(bm_add)

draw_set_color(choose(col1,col2));
//draw_set_circle_precision(irandom_range(3,8));
draw_circle(x,y,sqrt(sqrt(min(speed,20))),outline);

draw_set_color(c_white);
gpu_set_blendmode(bm_normal);

direction += choose(-dir, dir);
dir *= 1;
speed *= decrease;
if speed<0.01 instance_destroy();