play_sfx(sndWizardFire, 0.1, 1, true);

for(var i = -1; i < 2; i++){
	with(instance_create_layer(x, y, "Instances", objBullet, {team : tm.enemy, canDie : false})){
		team = tm.enemy;
		direction = other.gunAngle + (i * 20);
		speed = 2;
		damage = 2;
	}
}

alarm[2] = random_range(80, 100);