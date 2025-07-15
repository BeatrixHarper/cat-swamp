event_inherited();
randomise();

direction = choose(45, 45 + 90, 45 + 90 * 2, 45 + 90 * 3);
speed = 1.2;

meleeDamage = 1;

sprIdle = sprBugIdle;
sprWalk = sprBugIdle;

maxHealth = 2;
myHealth = maxHealth;

points = 50;

on_wall_x = function() {
	if alarm[0] <= 0{
		var _rand = 5;
		direction = 180 - direction + random_range(-_rand, _rand);
		
		alarm[0] = 10;
	}
}

on_wall_y = function() {
	if alarm[0] <= 0{
		var _rand = 5;
		direction = -direction + random_range(-_rand, _rand);
		
		alarm[0] = 10;
	}
}