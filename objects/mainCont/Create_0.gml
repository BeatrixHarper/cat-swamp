instance_create_depth(x, y, depth, visCont);

randomise();

global.numfont = font_add_sprite_ext(fntPixel, "abcdefghijklmnopqrstuvwxyz1234567890,/", false, 1);
global.numfontbig = font_add_sprite_ext(fntPixelBig, "abcdefghijklmnopqrstuvwxyz1234567890,/", false, 0);
global.timefont = font_add_sprite_ext(fntTime, "1234567890", false, 1);

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

stateNone = function() {
	transitionSprite = sprTransition;
	transitionX = -sprite_get_width(transitionSprite);
	transitionY = 0;
}

stateTransitionFromGame = function(){
	if draw_transition(0){
		room_goto_previous();
		transitionX += room_width;
	
		state = stateTransitionToMenu;
	}	
}

stateTransitionToMenu = function(){
	if draw_transition(1){
		global.points = 0;
		mainCont.currentTime = 0;
		state = stateNone;
	}
}

stateStartNewRun = function(){
	if draw_transition(0){
		global.points = 0;
		mainCont.currentTime = 0;
		transitionX += room_width;
		
		room_restart();
		
		state = stateBackToGame;
	}
}

stateBackToGame = function(){
	if draw_transition(1){
		state = stateNone;
	}
}

state = stateNone;