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
	motion_set(dashDir * 90, dashSpeed);
	coolDown = coolDownMax;
	canDash = false;
	
	alarm[alarms.dashdelay] = 25;
	alarm[alarms.iframes] = 20;
}