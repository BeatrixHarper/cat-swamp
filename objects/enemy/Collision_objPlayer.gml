if other.alarm[alarms.iframes] <= 0 && canHit == true{
	other.myHealth = max(other.myHealth - meleeDamage, 0);
	other.alarm[alarms.iframes] = 30;
	
	other.hit = true;
	
	play_sfx(sndPlayerHurt, 0.1, 1.1, true); 
	screenshake(2, 1, 0.1);
}