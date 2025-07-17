event_inherited();
randomise();

direction = choose(45, 45 + 90, 45 + 90 * 2, 45 + 90 * 3);
speed = random_range(0.8, 1.6);
image_speed = 0.2;

meleeDamage = 1;

sprIdle = sprBugIdle;

maxHealth = 2;
myHealth = maxHealth;

shadowSprite = sprShadow;
shadowX = 0;
shadowY = 18;

points = 50;

draw_shadow = function() { draw_sprite(shadowSprite, 0, x + shadowX, y + shadowY); }

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