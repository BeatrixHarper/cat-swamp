event_inherited();

var _x1 = 8 * 3,
	_y1 = 8 * 7,
	_x2 = room_width - _x1,
	_y2 = room_height - _y1 + 8 * 4;

sprIdle = sprWizardIdle;
sprWalk = sprIdle;

maxHealth = 8;
myHealth = maxHealth;

meleeDamage = 1;

sprWeapon = sprWand;

team = tm.enemy;

sprite_index = sprIdle;

positionX = random_range(_x1, _x2);
positionY = random_range(_y1, _y2);

walkSpeed = 2;

gunAngle = 0;
aimAngle = 0;

points = 100;

alarm[0] = random_range(120, 180); //moving
alarm[1] = random_range(20, 50); //aiming
alarm[2] = random_range(80, 100); //firing

on_hit = function() {
	alarm[0] = 1;
}