function fire(){
	wKick += 5;
	coolDown = coolDownMax;
	
	play_sfx(sndFire, 0.1, 0.8, true, 1);
	
	with(instance_create_layer(x, y, "Instances", objBullet, {team : tm.player, canDie : true})){
		direction = other.gunAngle;
		damage = 2;
	}
	
	screenshake(1, 1.2, 0.2);
}