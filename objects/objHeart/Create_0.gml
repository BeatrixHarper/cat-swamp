alarm[0] = 200;

image_speed = 0.2;

points = 10;
time = 0;
draw = true;

on_draw = function() {
	if time >= 10{
		draw = draw = 1 ? 0 : 1;
	
		time = 0;
	}
	
	if draw draw_self();
}