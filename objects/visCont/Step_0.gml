if os_browser != browser_not_a_browser{
	if display_get_width() != window_get_width() {
		window_set_size(display_get_width(),display_get_height());
	}
}

if (resized = false && global.fullscreen = false){
	scaledWidth = viewWidth * viewScale;
	scaledHeight = viewHeight * viewScale;

	display_set_gui_size(viewWidth * guiScale, viewHeight * guiScale);
	window_set_size(scaledWidth, scaledHeight);
	surface_resize(application_surface, scaledWidth, scaledHeight);
	
	resized = true;
}