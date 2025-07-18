event_inherited();

play_sfx(sndBugDead, 0.1, 1, true);

var _rand = 10;
repeat(random_range(3, 5)) instance_create_layer(x + random_range(-_rand, _rand), y + random_range(-_rand, _rand), "Instances", objChunks);