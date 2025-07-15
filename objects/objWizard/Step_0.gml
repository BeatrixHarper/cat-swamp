event_inherited();

if(gunAngle <= 90 || gunAngle > 270) gunRight = 1;
if(gunAngle > 90 && gunAngle <= 270) gunRight = -1;

if(direction <= 90 || direction > 270){ right = 1; spriteLeft = false; }
if(direction > 90 && direction <= 270){ right = -1; spriteLeft = true; }

var ad = angle_difference(aimAngle, gunAngle);

if (abs(ad) <= angle_rotate_tol) {
    gunAngle = aimAngle;
} else {
    gunAngle += ad*angle_rotate_frac;
}

if !point_in_circle(x, y, positionX, positionY, 20){
	motion_set(point_direction(x, y, positionX, positionY), walkSpeed);
}
else speed = 0;

if speed > 0 sprite_index = sprWalk[spriteLeft] else sprite_index = sprIdle[spriteLeft];