if keyboard_check(vk_f4) global.fullscreen = global.fullscreen ? 0 : 1;
window_set_fullscreen(global.fullscreen);

if os_browser != browser_not_a_browser{
	if display_get_width() != window_get_width() {
		window_set_size(display_get_width(),display_get_height());
	}
}