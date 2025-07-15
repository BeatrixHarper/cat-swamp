if objPlayer.myHealth < objPlayer.maxHealth{
	if random(4) <= 1{
		instance_create_depth(x, y, depth, objHeart);
	}
}

global.points += points;