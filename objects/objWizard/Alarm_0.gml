var _x1 = 8 * 3,
	_y1 = 8 * 7,
	_x2 = room_width - _x1,
	_y2 = room_height - _y1 + 8 * 4;

positionX = random_range(_x1, _x2);
positionY = random_range(_y1, _y2);

alarm[0] = random_range(120, 180);