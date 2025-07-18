event_inherited();

play_sfx(sndSummonDisappear, 0.2, 1);

var _rand = 10;
repeat(random_range(5, 10)) instance_create_layer(x + random_range(-_rand, _rand), y + random_range(-_rand, _rand), "Instances", objSmoke);