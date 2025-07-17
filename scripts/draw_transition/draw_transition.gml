function draw_transition(_direction){
	switch(_direction){
		case 0:
			draw_sprite(transitionSprite, 0, transitionX, transitionY);
	
			transitionX = lerp(transitionX, 0, 0.12);
	
			if round(transitionX) >= -1{
				return true;
			}
		break;
		case 1:
			draw_sprite_ext(transitionSprite, 0, transitionX + 2, transitionY + sprite_get_height(transitionSprite), -1, -1, image_angle, image_blend, image_alpha);
	
			transitionX = lerp(transitionX, room_width + sprite_get_width(transitionSprite), 0.2);
	
			if round(transitionX) >= room_width + sprite_get_width(transitionSprite) - 20 return true;
		break;
	}
}