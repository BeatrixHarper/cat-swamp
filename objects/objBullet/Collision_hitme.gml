if other.team != team{
	with(other){
		myHealth = max(myHealth - other.damage, 0);
		if(variable_instance_exists(self, "on_hit")) { on_hit(); }
	}
	
	instance_destroy();
}