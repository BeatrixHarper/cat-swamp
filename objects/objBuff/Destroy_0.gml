event_inherited();

play_sfx(sndBuffDead, 0.1, 1);

var _rand = 10;
repeat(random_range(5, 8)) instance_create_layer(x + random_range(-_rand, _rand), y + random_range(-_rand, _rand), "Instances", objChunks, {sprite_index : sprChunksRock});