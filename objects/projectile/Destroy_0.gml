with(instance_create_depth(x, y, depth, objBulletHit)){
	team = other.team;
	sprite_index = team = tm.player ? sprBulletHit : sprEnemyBulletHit;
	image_angle = other.direction;
}