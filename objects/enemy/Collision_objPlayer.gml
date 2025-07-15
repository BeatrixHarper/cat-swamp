if other.alarm[alarms.iframes] <= 0{
	other.myHealth = max(other.myHealth - meleeDamage, 0);
	other.alarm[alarms.iframes] = 20;
}