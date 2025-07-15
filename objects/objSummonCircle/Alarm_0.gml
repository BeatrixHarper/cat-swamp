instance_create_depth(x, y, depth, summon);

sprite_index = sprSummonCircleDisappear
image_index = 0

repeat(random_range(3, 4)) instance_create_depth(x + random_range(-10, 10), y + random_range(-10, 10), depth, objSummonParticle);