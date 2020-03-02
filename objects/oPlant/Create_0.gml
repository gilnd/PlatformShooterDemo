/// @description Init

image_speed = 0;
image_index = irandom(image_number);
image_xscale = choose(1,-1)//Random Flip Horizontaly

depth = depth + irandom_range(-100,100);
//tDepth = layer_get_depth("DecorationsAbove");
//tDepth += choose(-100, -200, 0) 

//tlid = layer_get_id_at_depth(tDepth);
//layer_element_move(id, tlid)

//depth += choose(150, 50, 0, -150);//goes two layer down

increase = random_range(-1, 1);
incCycle = choose(true, false);

collideWithPlayer = false;
bounceCount = irandom_range(2,4);