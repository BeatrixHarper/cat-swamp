event_inherited();

sprWalkRight = sprBuffWalkRight;
sprWalkLeft = sprBuffWalkLeft;

maxHealth = 14;
myHealth = maxHealth;

shadowSprite = sprShadowBig;
shadowX = 0;
shadowY = 12;

meleeDamage = 2;

sprite_index = sprIdle;
friction = 0.5;

image_speed = 0;


idle = 0;

points = 100;

currentStep = 0;

stateIdle = function() {
	image_speed = 0;
	
	if idle++ > random_range(40, 50){
		direction = point_direction(x, y, objPlayer.x + objPlayer.hspeed * 1.2 + random_range(-5, 5), objPlayer.y + objPlayer.vspeed * 1.2 + random_range(-5, 5));
		speed = 10;
		idle = 0;
		currentStep = currentStep ? 0 : 1;
		state = stateWalk;
	}
}

stateWalk = function() {
	image_speed = 0.2;
	
	if speed <= 0{ screenshake(1, 3, 0.2); state = stateIdle; }
}

state = stateIdle;

draw_shadow = function() { draw_sprite(shadowSprite, 0, x + shadowX, y + shadowY); }