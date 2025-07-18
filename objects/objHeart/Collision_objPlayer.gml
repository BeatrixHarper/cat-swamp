other.myHealth = min(other.myHealth + 2, other.maxHealth);
instance_create_layer(x, y, "Instances", objPoint, {text : points});
global.points += points;

instance_destroy();