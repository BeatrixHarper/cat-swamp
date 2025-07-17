if room = rm1{
	if global.inPauseMenu{
		if sprite_exists(pauseScreenshot) draw_sprite_ext(pauseScreenshot, 0, 0, 0, 1 / currentViewScale * currentGuiScale, 1 / currentViewScale * currentGuiScale, image_angle, image_blend, image_alpha);
	
		draw_gui();
	
		timer++;
	
		var frq = 0.1,
		amp = 0.05,
		posX = display_get_gui_width() / 2,
		posY = (display_get_gui_height() / 2) + sin(timer / 2 * frq) * amp * 50;
	
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_underline(posX, posY, "paused", c_white, c_black);
	}
}

state();