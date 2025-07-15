for(var i = -1; i < 2; i++){
	with(instance_create_depth(x, y, depth, objBullet, {team : tm.enemy, canDie : false})){
		direction = other.gunAngle + (i * 20);
		speed = 2;
		damage = 2;
	}
}

alarm[2] = random_range(80, 100);