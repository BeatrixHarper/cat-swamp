instance_create_layer(x, y, "Instances", visCont);

randomise();

window_set_cursor(cr_none);

global.numfont = font_add_sprite_ext(fntPixel, "abcdefghijklmnopqrstuvwxyz1234567890,/", false, 1);
global.timefont = font_add_sprite_ext(fntTime, "abcdefghijklmnopqrstuvwxyz1234567890-%CFS<>V^:", false, 1);

currentTime = 0;
deadTimer = 0;

global.inPauseMenu = false;
global.fullscreen = false;
global.points = 0;

ini_open("save.ini");
global.highscore = ini_read_real("score", "highscore", 0);

global.dashInputType = ini_read_real("settings", "dashinputtype", dashinput.double);
global.volume = ini_read_real("settings", "volume", 100);
global.screenshake = ini_read_real("settings", "screenshake", 100);
ini_close();

global.newScore = false;

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
		global.newScore = false;
		mainCont.currentTime = 0;
		
		state = stateNone;
	}
}

stateStartNewRun = function(){
	if draw_transition(0){
		global.points = 0;
		global.newScore = false;
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