instance_create_depth(x, y, depth, visCont);

randomise();

global.numfont = font_add_sprite_ext(fntPixel, "abcdefghijklmnopqrstuvwxyz1234567890,/", false, 1);
global.numfontbig = font_add_sprite_ext(fntPixelBig, "abcdefghijklmnopqrstuvwxyz1234567890,/", false, 0);

currentTime = 0;
deadTimer = 0;

global.inPauseMenu = false;
global.points = 0;
global.fullscreen = false;

timer = 0;

currentHealth = 0;
currentMaxHealth = 0;
currentViewScale = 0;
currentGuiScale = 0;
pauseScreenshot = -1;