image_xscale = right ? 1 : -1;

if(direction <= 90 || direction > 270) right = 1;
if(direction > 90 && direction <= 270) right = -1;

if myHealth <= 0 instance_destroy();

if (hit && hitalarm = -1) {
   hitalarm = 0.5;
}

if hitalarm > 0 hitalarm -= 0.1 else if hitalarm <= 0{ hitalarm = -1; hit = false; }