function dash_check(){
	with(objPlayer){
		if nextDash != dashDir canDash = false;
		
		if !canDash{ canDash = true; nextDash = dashDir; alarm[alarms.dashinput] = 15; }
		else if canDash && nextDash = dashDir{
			dash();

			canDash = false;
		}
	}
}

function dash() {
	play_sfx(sndPlayerDash, 0.1, 1, true);
	
	instance_create_layer(x, y, "Instances", objSmoke);
	
	motion_set(dashDir * 90, dashSpeed);
	coolDown = coolDownMax;
	canDash = false;
	
	alarm[alarms.dashdelay] = 25;
	alarm[alarms.iframes] = 20;
}