event_inherited();

if anim_end{ image_speed = 0; image_index = 1; }

image_angle = direction;

if x >= room_width or x <= 0 or y >= room_height or y <= 0 instance_destroy(self, false);