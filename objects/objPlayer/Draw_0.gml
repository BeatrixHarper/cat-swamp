if state != stateDead{
	var _gundis = 10,
		_gunangle = gunAngle,
		_right = right,
		_wkick = wKick,
	
		_sprite = sprGun,
		_frame = 0,
		_x = x + lengthdir_x(_gundis - _wkick, _gunangle),
		_y = y + lengthdir_y(_gundis - _wkick, _gunangle),
		_xscale = image_xscale * _right,
		_yscale = image_yscale * _right,
		_angle = _gunangle + (_wkick * 10 * _right),
		_blend = image_blend,
		_alpha = image_alpha;

	if _gunangle <= 180 draw_underline_ext(_sprite, _frame, _x, _y, _xscale, _yscale, _angle, _blend, _alpha, c_black);
	if alarm[alarms.iframes] > 0 image_alpha = 0.5;
	draw_underline_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, c_black);
	image_alpha = 1;
	if _gunangle > 180 draw_underline_ext(_sprite, _frame, _x, _y, _xscale, _yscale, _angle, _blend, _alpha, c_black);
}