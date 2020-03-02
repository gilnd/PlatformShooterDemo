var wave, wave_del;
	wave     = sin(time)*off;
	wave_del = sin(time*1.5)*off;

time += add;
//y = ystart + 6;

draw_sprite_pos(sprite_index, image_index, x + wave, y, x+16 + wave_del, y, x+16, y+16, x, y+16, 1);

var collide = scrOver(oPlayer, oBullet, oEnemy);

if (collide && move == true) {
	if (add <= (start_add*3)-0.005) {
		add += approach2(add, start_add*3, 0.25);
		off += approach2(off, 8, 0.1);
		
		//if (irandom(2) == 1) instance_create_depth(x + random_range(12, 20), y + 8, depth, part_leaves);
	} else {
		move = false;
	}
} else if (!collide) {
	move = true;
}

if (move = false || !collide) {
	off += approach2(off, 2, 0.05);
	add += approach2(add, start_add, 0.05);
}