//room = rm1;

timer = 0;
flickertimer = 0;
draw = true;
yRoot = 80;

String[0] = "start game";
String[1] = "settings";

currentSelection = 0;
currentSelectionMax = 1;

transitionSprite = sprTransition;
transitionX = -sprite_get_width(transitionSprite);
transitionY = 0;

stateInitial = function() {
	if keyboard_check_pressed(vk_enter) state = stateTransitionToGame;
	
	yRoot = 80;
	
	draw_set_font(global.numfontbig);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var posX = (room_width / 2);
	
	flickertimer++;
	
	if flickertimer >= 40{
		draw = draw = 1 ? 0 : 1;
	
		flickertimer = 0;
	}
	
	if draw draw_text_underline(posX, 180, "press enter");
}

stateSelect = function(){
	yRoot = lerp(yRoot, 40, 0.1);
		
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	for(var i = 0; i < 2; i++){
		var posX = (room_width / 2) - (string_width(String[i]) / 2),
			posY = 160,
			sep = 6,
			selectionOffset = currentSelection = i ? 20 : 0,
			offsetY = i ? string_height(String[1]) + sep : 0;
		
		if point_in_rectangle(mouse_x, mouse_y, posX + selectionOffset, posY + offsetY, posX + selectionOffset + string_width(String[i]), posY + offsetY + string_height(String[i])){
			currentSelection = i;
			if currentSelection = 0 && mouse_check_button_pressed(mb_left) state = stateTransitionToGame;
		}
		else{
			if keyboard_check_pressed(ord("S")) currentSelection = min(currentSelection + 1, currentSelectionMax);
			if keyboard_check_pressed(ord("W")) currentSelection = max(currentSelection - 1, 0);	
		}
		
		switch(currentSelection){
			case 0:
				if keyboard_check_pressed(vk_enter) state = stateTransitionToGame;
			break;
		}
		
		draw_text_underline(posX + selectionOffset, posY + offsetY, String[i]);
	}
}

stateTransitionToGame = function() {
	draw_sprite(transitionSprite, 0, transitionX, transitionY);
	
	transitionX = lerp(transitionX, 0, 0.12);
	
	if round(transitionX) >= -1{
		room_goto_next();
		state = stateTransitionFromGame;
	}
}

stateTransitionFromGame = function() {
	draw_sprite(transitionSprite, 0, transitionX, transitionY);
	
	transitionX = lerp(transitionX, -sprite_get_width(transitionSprite), 0.2);
	
	if round(transitionX) <= -sprite_get_width(transitionSprite) + 20 instance_destroy();
}

state = stateInitial;