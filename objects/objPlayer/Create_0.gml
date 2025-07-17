enum alarms {
	dashinput,
	iframes,
	dashdelay,
}

image_speed = 0.2;

friction = 0.2;
canControl = true;
walkSpeed = 1;
maxSpeed = 1.4 + friction;

canHit = true;

right = false;
gunAngle = point_direction(x, y, mouse_x, mouse_y);

maxHealth = 6;
myHealth = maxHealth;

sprIdle = sprPlayerIdle;
sprWalk = sprPlayerWalk;
shadowSprite = sprShadow;
shadowX = 0;
shadowY = 5;

wKick = 0;
team = tm.player;

coolDown = 0;
coolDownMax = 13;

sprite_index = sprIdle;

canDash = false;
dashSpeed = 14;

dashDir = 0;
nextDash = 0;

hasiframes = true;

hit = false;
hitalarm = -1;

stateFree = function() {
	mMove[move.left] = keyboard_check(ord("A"));
	mMove[move.right] = keyboard_check(ord("D"));
	mMove[move.up] = keyboard_check(ord("W"));
	mMove[move.down] = keyboard_check(ord("S"));

	mMovePressed[move.left] = keyboard_check_pressed(ord("A"));
	mMovePressed[move.right] = keyboard_check_pressed(ord("D"));
	mMovePressed[move.up] = keyboard_check_pressed(ord("W"));
	mMovePressed[move.down] = keyboard_check_pressed(ord("S"));
	
	var mH = mMove[move.right] - mMove[move.left],
		mV = mMove[move.down] - mMove[move.up],
		mMovement = point_direction(0, 0, mH, mV);
		
	if mMovement > 0{
		mH /= mMovement;
		mV /= mMovement;
	}
	
	if mH != 0 or mV != 0 motion_add(point_direction(0, 0, mH, mV), walkSpeed);
	
	image_xscale = right ? 1 : -1;
	
	if speed > maxSpeed speed -= friction * speed;
	if wKick > 0 wKick-- else wKick = 0;
	
	if speed > 0 sprite_index = sprWalk else sprite_index = sprIdle;
	
	gunAngle = point_direction(x, y, mouse_x, mouse_y);
	
	if(gunAngle < 90 || gunAngle > 270) right = 1;
	if(gunAngle > 90 && gunAngle < 270) right = -1;
	
	if alarm[alarms.iframes] > 0 canHit = false;
	
	if coolDown coolDown--;
	if mouse_check_button(mb_left) && coolDown <= 0 fire();
	
	if (hit && hitalarm = -1) {
	   hitalarm = 1;
	}

	if hitalarm > 0 hitalarm -= 0.1 else if hitalarm <= 0{ hitalarm = -1; hit = false; }
	
	if alarm[alarms.dashdelay] <= 0{
		switch(global.dashInputType){
			case dashinput.double:
				for(var i = 0; i < 4; i++){
					if mMovePressed[i]{ dashDir = i; dash_check(); }	
				}
			break;
			case dashinput.space:
				for(var i = 0; i < 4; i++){
					if mMove[i] && keyboard_check_pressed(vk_space){ dashDir = i; dash(); }	
				}
			break;
		}
	}

	if myHealth <= 0{
		var _rand = 10;
		repeat(random_range(3, 5)) instance_create_depth(x + random_range(-_rand, _rand), y + random_range(-_rand, _rand), depth, objChunks);
		
		mask_index = sprNone;
		
		screenshake(5, 10, 0.3);
		
		state = stateDead;
	}
}

stateDead = function() {};

draw_shadow = function() { if state != stateDead draw_sprite(shadowSprite, 0, x + shadowX, y + shadowY); }

on_draw = function() {
	if state != stateDead{
		var _gundis = 10,
			_gunangle = gunAngle,
			_right = right,
			_wkick = wKick,
			_yOffset = 5,
	
			_sprite = sprGun,
			_frame = 0,
			_x = x + lengthdir_x(_gundis - _wkick, _gunangle),
			_y = y + lengthdir_y(_gundis - _wkick, _gunangle) - _yOffset,
			_xscale = image_xscale * _right,
			_yscale = image_yscale * _right,
			_angle = _gunangle + (_wkick * 10 * _right),
			_blend = image_blend,
			_alpha = image_alpha;

		if _gunangle <= 180 draw_underline_ext(_sprite, _frame, _x, _y, _xscale, _yscale, _angle, _blend, _alpha, c_black);
		//if alarm[alarms.iframes] > 0 image_alpha = 0.5;
		
		if (hit) {
		    shader_set(shd_hit);
		    draw_sprite_ext(sprite_index, image_index, x, y - _yOffset, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		    shader_reset();

		} else {
		    draw_underline_ext(sprite_index, image_index, x, y - _yOffset, image_xscale, image_yscale, image_angle, image_blend, image_alpha, c_black);
		}
		
		//image_alpha = 1;
		if _gunangle > 180 draw_underline_ext(_sprite, _frame, _x, _y, _xscale, _yscale, _angle, _blend, _alpha, c_black);
	}
}

state = stateFree;