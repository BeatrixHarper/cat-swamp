if other.team != team{
	with(other){
		if (variable_instance_get(self, "hasiframes") = 1 && variable_instance_get(self, alarm[alarms.iframes]) <= 0) or !variable_instance_exists(self, hasiframes){
			myHealth = max(myHealth - other.damage, 0);
			if(variable_instance_exists(self, "on_hit")) { on_hit(); }
			if(variable_instance_get(self, "hasiframes") = true) { alarm[alarms.iframes] = 20; }
		}
	}
	
	instance_destroy();
}