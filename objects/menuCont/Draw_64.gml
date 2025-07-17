if state != stateTransitionFromMenu{
	var frq = 0.1,
		amp = 0.08,
		posX = (room_width / 2) - (sprite_get_width(sprLogo) / 2),
		posY = yRoot + sin(timer / 5 * frq) * amp * 80;

	draw_sprite(sprLogo, 0, posX, posY);
}

state();

timer++;