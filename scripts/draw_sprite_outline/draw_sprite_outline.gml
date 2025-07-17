function draw_sprite_outline(col, spriteindex, imageindex, _x, _y){
	gpu_set_fog(true, col, 0, 0);
	draw_sprite(spriteindex, imageindex, _x + 1, _y);
	draw_sprite(spriteindex, imageindex, _x, _y + 1);
	draw_sprite(spriteindex, imageindex, _x - 1, _y);
	draw_sprite(spriteindex, imageindex, _x, _y - 1);
	gpu_set_fog(false, c_black, 0, 0);
	
	draw_sprite(spriteindex, imageindex, _x, _y);
}

function draw_sprite_outline_ext(col, spriteindex, imageindex, _x, _y, imagexscale, imageyscale, imageangle, imageblend, imagealpha){
	gpu_set_fog(true, col, 0, 0);
	draw_sprite_ext(spriteindex, imageindex, _x + 1, _y, imagexscale, imageyscale, imageangle, imageblend, imagealpha);
	draw_sprite_ext(spriteindex, imageindex, _x, _y + 1, imagexscale, imageyscale, imageangle, imageblend, imagealpha);
	draw_sprite_ext(spriteindex, imageindex, _x - 1, _y, imagexscale, imageyscale, imageangle, imageblend, imagealpha);
	draw_sprite_ext(spriteindex, imageindex, _x, _y - 1, imagexscale, imageyscale, imageangle, imageblend, imagealpha);
	gpu_set_fog(false, c_black, 0, 0);
	
	draw_sprite_ext(spriteindex, imageindex, _x, _y, imagexscale, imageyscale, imageangle, imageblend, imagealpha);
}