event_inherited();

sprIdle = sprBuffIdle;
sprWalk = sprIdle;

maxHealth = 20;
myHealth = maxHealth;

meleeDamage = 2;
team = tm.enemy;

sprite_index = sprIdle;
friction = 0.4;

idle = 0;

points = 80;

stateIdle = function() {
	if idle++ > 60{
		direction = point_direction(x, y, objPlayer.x, objPlayer.y);
		speed = 7;
		idle = 0;
		state = stateWalk;
	}
}

stateWalk = function() {
	if speed <= 0 state = stateIdle;
}

state = stateIdle;