if anim_end && sprite_index = sprSummonCircleAppear{
	image_index = 0;
	sprite_index = sprSummonCircleIdle
}

if anim_end && sprite_index = sprSummonCircleDisappear{
	repeat(random_range(2, 3)) instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", objSummonParticle);
	instance_destroy();	
}