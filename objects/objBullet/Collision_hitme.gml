if other.team != team{
	with(other){
		myHealth -= other.damage;
		if(variable_instance_exists(self, "on_hit")) { on_hit(); }
	}
	
	instance_destroy();
}