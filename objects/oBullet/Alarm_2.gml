/// @description Change direction to 45
direction = direction  +  ((changeDirState==0) ? angle : -angle);
image_angle = direction;
changeDirState = ( changeDirState==0 ) ? 1 : 0;
alarm[2] = delay;