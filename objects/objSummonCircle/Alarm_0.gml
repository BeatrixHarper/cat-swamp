instance_create_layer(x, y, "Instances", summon);

sprite_index = sprSummonCircleDisappear
image_index = 0

repeat(random_range(3, 4)) instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", objSummonParticle);