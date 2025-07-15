var _gundis = 10,
	_gunangle = other.gunAngle,
	_right = other.right,
	_gunright = other.gunRight,
	
	_sprite = sprWand,
	_frame = 0,
	_x = x + lengthdir_x(_gundis, _gunangle),
	_y = y + lengthdir_y(_gundis, _gunangle),
	_xscale = image_xscale * _gunright,
	_yscale = image_yscale * _gunright,
	_angle = _gunangle,
	_blend = image_blend,
	_alpha = image_alpha;

if _gunangle <= 180 draw_underline_ext(_sprite, _frame, _x, _y, _xscale, _yscale, _angle, _blend, _alpha, c_black);
draw_underline_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, c_black);
if _gunangle > 180 draw_underline_ext(_sprite, _frame, _x, _y, _xscale, _yscale, _angle, _blend, _alpha, c_black);