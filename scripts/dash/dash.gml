function dash(){
	with(objPlayer){
		if nextDash != dashDir canDash = false;
		
		if !canDash{ canDash = true; nextDash = dashDir; alarm[alarms.dashinput] = 15; }
		else if canDash && nextDash = dashDir{
			motion_add(dashDir * 90, dashSpeed);
			coolDown = coolDownMax;
			canDash = false;
			alarm[alarms.iframes] = 15;
		}
	}
}