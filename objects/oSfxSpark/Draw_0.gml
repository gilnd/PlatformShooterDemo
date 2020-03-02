gpu_set_blendmode(bm_add)

draw_set_color(merge_color(colour1,colour2,0.5))
draw_line_width(ppppx,ppppy,ppx,ppy,sqrt(min(speed,1))*0.6);

draw_set_color(colour2);
draw_line_width(pppx,pppy,xprevious,yprevious,sqrt(min(speed,1))*0.8);
draw_set_color(colour1);
draw_line_width(px,py,x,y,sqrt(min(speed,1))*1);
//draw_sprite_ext(sPixel,0,x+0.5,y+0.5,sqrt(min(speed,1)),sqrt(min(speed,1)),0,colour1,sqrt(min(speed,1)));
draw_circle_color(x,y,sqrt(sqrt(min(speed,1))),colour2,c_black,0);

gpu_set_blendmode(bm_normal);
ppppx = pppx;
ppppy = pppy;
pppx = ppx;
pppy = ppy;
ppx = px;
ppy = py;
px = xprevious;
py = yprevious;
direction += choose(-dir, dir);
if(!moveZigZag) dir *= 1;
else if(irandom(100)>95) dir += (choose(1, -1) * choose(15, 25, 45, 75, 90))
speed *= decrease;
if speed<0.01 instance_destroy();
