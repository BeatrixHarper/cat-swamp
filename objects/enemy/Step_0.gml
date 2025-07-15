image_xscale = right ? 1 : -1;

if(direction <= 90 || direction > 270) right = 1;
if(direction > 90 && direction <= 270) right = -1;

if myHealth <= 0 instance_destroy();