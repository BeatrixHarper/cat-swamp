if alarm[0] <= 100 && alarm[0] > 50{
	image_index = 3;
	time++;
}
else if alarm[0] <= 50{
	time += 2;
	image_index = 2;
}