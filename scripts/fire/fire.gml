function fire(){
	wKick += 5;
	coolDown = coolDownMax;
	
	with(instance_create_depth(x, y, depth, objBullet, {team : tm.player, canDie : true})){
		direction = other.gunAngle;
		damage = 2;
	}
	
	//instance_create_depth(mouse_x, mouse_y, depth, objHeart);
}