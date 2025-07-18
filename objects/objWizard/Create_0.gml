event_inherited();

var _x1 = 8 * 3,
	_y1 = 8 * 7,
	_x2 = room_width - _x1,
	_y2 = room_height - _y1 + 8 * 4;

sprIdle[0] = sprWizardIdleRight;
sprWalk[0] = sprWizardWalkRight;

sprIdle[1] = sprWizardIdleLeft;
sprWalk[1] = sprWizardWalkLeft;

maxHealth = 8;
myHealth = maxHealth;

//shadowSprite = sprShadow;
//shadowX = 0;
//shadowY = 16;

meleeDamage = 1;

sprWeapon = sprWand;

team = tm.enemy;

image_speed = 0.1;
sprite_index = sprIdle[0];

positionX = random_range(_x1, _x2);
positionY = random_range(_y1, _y2);

walkSpeed = 2;

spriteLeft = false;

gunAngle = 0;
aimAngle = 0;

angle_rotate_frac = 0.3;
angle_rotate_tol = 1;

points = 80;

alarm[0] = random_range(120, 180); //moving
alarm[1] = random_range(20, 50); //aiming
alarm[2] = random_range(80, 100); //firing

play_sfx(sndWizardLaugh, 0.1, 0.9, true);

on_hit = function() {
	alarm[0] = 1;
}

on_draw = function() {
	var _gundis = 10,
		_gunangle = gunAngle,
		_right = right,
		_gunright = gunRight,
		
		_sprite = sprWand,
		_frame = 0,
		_x = x + lengthdir_x(_gundis, _gunangle),
		_y = y + lengthdir_y(_gundis, _gunangle),
		_xscale = image_xscale * _gunright,
		_yscale = image_yscale * _gunright,
		_angle = _gunangle,
		_blend = image_blend,
		_alpha = image_alpha;
	
	//draw_sprite(shadowSprite, 0, x + shadowX, y + shadowY);
	
	if _gunangle <= 180 draw_underline_ext(_sprite, _frame, _x, _y, _xscale, _yscale, _angle, _blend, _alpha, c_black);
	
	if (hit) { 
	    shader_set(shd_hit);
	    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	    shader_reset();

	} else {
	    draw_underline_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, c_black);
	}
	
	if _gunangle > 180 draw_underline_ext(_sprite, _frame, _x, _y, _xscale, _yscale, _angle, _blend, _alpha, c_black);	
}