instance_create_depth(x, y, depth, visCont);

randomise();

global.numfont = font_add_sprite_ext(fntPixel, "abcdefghijklmnopqrstuvwxyz1234567890,/", false, 1);

currentTime = 0;
deadTimer = 0;

global.inPauseMenu = false;
global.points = 0;

timer = 0;

currentHealth = 0;
currentMaxHealth = 0;
currentViewScale = 0;
currentGuiScale = 0;
pauseScreenshot = -1;