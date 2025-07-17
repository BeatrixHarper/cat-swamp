image_index = random(image_number);
image_speed = 0;
image_xscale = choose(-1, 1);
image_alpha = 0.5;
depth = -100;

_speed = random_range(0.4, 0.6);
side = choose(0, 1);
leftBarrier = -sprite_get_width(sprite_index);
rightBarrier = room_width + sprite_get_width(sprite_index);

var roomPadding = 11;

y = random_range(0 - sprite_get_height(sprite_index) + roomPadding, room_height - roomPadding);
x = side = 1 ? rightBarrier : leftBarrier;