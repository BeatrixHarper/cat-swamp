enum alarms {
	dashinput,
	iframes,
}

image_speed = 0.2;

friction = 0.2;
canControl = true;
walkSpeed = 1;
maxSpeed = 1.4 + friction;

canHit = true;

maxHealth = 6;
myHealth = maxHealth;

sprIdle = sprPlayerIdle;
sprWalk = sprIdle;

wKick = 0;
team = tm.player;

coolDown = 0;
coolDownMax = 13;

sprite_index = sprIdle;

canDash = false;
dashSpeed = 10;

dashDir = 0;
nextDash = 0;

right = false;
gunAngle = point_direction(x, y, mouse_x, mouse_y);

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
	
	gunAngle = point_direction(x, y, mouse_x, mouse_y);
	
	if(gunAngle < 90 || gunAngle > 270) right = 1;
	if(gunAngle > 90 && gunAngle < 270) right = -1;
	
	if alarm[alarms.iframes] > 0 canHit = false;
	
	if coolDown coolDown--;
	if mouse_check_button(mb_left) && coolDown <= 0 fire();
	
	if mMovePressed[move.left]{ dashDir = move.left; dash(); }
	if mMovePressed[move.right]{ dashDir = move.right; dash(); }
	if mMovePressed[move.down]{ dashDir = move.down; dash(); }
	if mMovePressed[move.up]{ dashDir = move.up; dash(); }
	
	if myHealth <= 0 state = stateDead;
}

stateDead = function() {};

state = stateFree;