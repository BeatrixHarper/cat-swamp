event_inherited();

if(gunAngle < 90 || gunAngle > 270) gunRight = 1;
if(gunAngle > 90 && gunAngle < 270) gunRight = -1;

gunAngle = lerp(gunAngle, aimAngle, 0.2);

if !point_in_circle(x, y, positionX, positionY, 20){
	motion_set(point_direction(x, y, positionX, positionY), walkSpeed);
}
else speed = 0;