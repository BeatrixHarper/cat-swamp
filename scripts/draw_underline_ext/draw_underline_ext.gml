function draw_underline_ext(_sprite, _image, _x, _y, _xs, _ys, _rot, _col, _alpha, _back){
	gpu_set_fog(true, _back, 0, 0);
	
	draw_sprite_ext(_sprite, _image, _x, _y + 1, _xs, _ys, _rot, _col, _alpha);
	draw_sprite_ext(_sprite, _image, _x - 1, _y + 1, _xs, _ys, _rot, _col, _alpha);
	draw_sprite_ext(_sprite, _image, _x + 1, _y + 1, _xs, _ys, _rot, _col, _alpha);
	
	gpu_set_fog(false, c_white, 0, 0);
	

	draw_sprite_ext(_sprite, _image, _x, _y, _xs, _ys, _rot, _col, _alpha);
}