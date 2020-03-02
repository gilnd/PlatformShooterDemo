gpu_set_blendmode(bm_add)

draw_set_color(choose(col1,col2));

draw_set_alpha(sqrt(min(speed,1))*0.8);
draw_lightning(originX,originY,px,py, 1, 4, 1, 8);
draw_set_alpha(1);

draw_set_color(c_white);

gpu_set_blendmode(bm_normal);

pppx = ppx;
pppy = ppy;
ppx = px;
ppy = py;
px = xprevious;
py = yprevious;

speed *= decrease;
if (speed<0.01 or image_alpha <= 0) {
	instance_destroy();
}