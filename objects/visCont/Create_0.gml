#macro view view_camera[0]

depth_grid = ds_grid_create(1, 1);

viewWidth = 256;
viewHeight = 288;

viewScale = 2;
guiScale = 1;

scaledWidth = viewWidth * viewScale;
scaledHeight = viewHeight * viewScale;

display_set_gui_size(viewWidth * guiScale, viewHeight * guiScale);
window_set_size(scaledWidth, scaledHeight);
surface_resize(application_surface, scaledWidth, scaledHeight);

resized = false;

shake = true;
shakeTime = 0;
shakeMagnitude = 0;
shakeFade = 0.25;