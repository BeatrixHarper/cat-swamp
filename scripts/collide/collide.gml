function collide(){
	var xspd = hspeed,
	yspd = vspeed,
	xfac = max(abs(xspd * 0.1), 0.1),
	yfac = max(abs(yspd * 0.1), 0.1),
	object = collideable;

	x = xprevious;
	y = yprevious;

	for(var ix = 0; ix < abs(xspd); ix += xfac){
	    if (!place_meeting(x + (sign(xspd) * xfac), y, object)) {
	        x += sign(xspd) * xfac;
		}
		else if variable_instance_exists(self, "on_wall") { on_wall(); }
		else if variable_instance_exists(self, "on_wall_x") { on_wall_x(); }
	}

	for(var iy = 0; iy < abs(yspd); iy += yfac){
	    if (!place_meeting(x, y + (sign(yspd) * yfac), object)) {
	        y += sign(yspd) * yfac;
		}
		else if variable_instance_exists(self, "on_wall") { on_wall(); }
		else if variable_instance_exists(self, "on_wall_y") { on_wall_y(); }
	}
}