other.myHealth = min(other.myHealth + 2, other.maxHealth);
instance_create_depth(x, y, depth, objPoint, {text : points});
global.points += points;

instance_destroy();