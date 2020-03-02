/// @description Init
decrease = 0.9;

makeSmoke = true;
destroyOnWallCollision = false;

primaryColor = c_black;
accentColor = c_gray;

image_angle = direction;
image_speed = (irandom(10)>5) ? 0 : irandom_range(5, room_speed/2);
image_index = irandom_range(0, image_number);
