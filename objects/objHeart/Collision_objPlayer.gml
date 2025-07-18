other.myHealth = min(other.myHealth + 2, other.maxHealth);
instance_create_layer(x, y, "Instances", objPoint, {text : points});
global.points += points;

play_sfx(sndHealthPickup, 0.1, 1);

instance_destroy();