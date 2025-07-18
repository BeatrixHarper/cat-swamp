with(instance_create_layer(x, y, "Instances", objBulletHit)){
	team = other.team;
	sprite_index = team = tm.player ? sprBulletHit : sprEnemyBulletHit;
	image_angle = other.direction;
}