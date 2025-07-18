if room = rm1{
	if global.inPauseMenu{
		if sprite_exists(pauseScreenshot){
			gpu_set_blendenable(false);
			draw_sprite_ext(pauseScreenshot, 0, 0, 0, 1 / currentViewScale * currentGuiScale, 1 / currentViewScale * currentGuiScale, image_angle, image_blend, c_white);
			gpu_set_blendenable(true);
		}
	
		draw_gui();
	
		timer++;
	
		var frq = 0.1,
		amp = 0.05,
		posX = display_get_gui_width() / 2,
		posY = (display_get_gui_height() / 2) + sin(timer / 2 * frq) * amp * 50;
	
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(global.timefont);
		draw_text_underline(posX, posY, "paused", c_white, c_black);
		draw_text_underline(posX, 180, InputDeviceGetPlayerUsingGamepad() = 0 ? "start to unpause\n\nselect to exit" : "escape to unpause\n\nspace to exit");
		
		if InputPressed(INPUTS.EXITRUN){
			global.inPauseMenu = false;
			
			if sprite_exists(pauseScreenshot){
				sprite_delete(pauseScreenshot);	
			}
			instance_activate_all();
			
			state = stateTransitionFromGame;
		}
	}
}

state();

if !(InputDeviceGetPlayerUsingGamepad() = 0) draw_underline_ext(sprCursor, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1, 1, 0, c_white, 1, c_black);