if other.alarm[alarms.iframes] <= 0{
	other.myHealth -= meleeDamage;
	other.alarm[alarms.iframes] = 20;
}