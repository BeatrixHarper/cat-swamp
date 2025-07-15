event_inherited();

image_angle = direction;
damage = 0;

if team = tm.player sprite_index = sprBullet;
else if team = tm.enemy sprite_index = sprEnemyBullet;

speed = 5;

if canDie = true alarm[0] = 30;