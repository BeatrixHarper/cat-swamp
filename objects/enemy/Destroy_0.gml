if objPlayer.myHealth < objPlayer.maxHealth{
	if random(4) <= 1{
		instance_create_layer(x, y, "Instances", objHeart);
	}
}

instance_create_layer(x, y, "Instances", objPoint, {text : other.points});
global.points += points;