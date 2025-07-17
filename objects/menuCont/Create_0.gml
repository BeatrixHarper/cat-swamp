timer = 0;
flickertimer = 0;
draw = true;
yRoot = 80;

xRoot = 8;
selectionString[0] = "F start game";
currentX[0] = xRoot;
selectionString[1] = "S settings";
currentX[1] = xRoot;
selectionString[2] = "< back";
currentX[2] = xRoot;
optionCount = array_length(selectionString);

selecting = false;
currentSelection = 0;

xSettingsRoot = 8;
settingsString[0] = "> dash";
currentSettingsX[0] = xSettingsRoot;
settingsString[1] = "V volume";
currentSettingsX[1] = xSettingsRoot;
settingsString[2] = "^ screenshake";
currentSettingsX[2] = xSettingsRoot;
settingsString[3] = "< back";
currentSettingsX[3] = xSettingsRoot;
optionSettingsCount = array_length(settingsString);

settingsSelecting = false;
currentSettingsSelection = 0;

transitionSprite = sprTransition;
transitionX = -sprite_get_width(transitionSprite);
transitionY = 0;

mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;

stateInitial = function() {
	if keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left){
		state = stateSelect;
		for(var i = 0; i < optionCount; i++){
			xRoot = -20;
			currentX[i] = xRoot;
			currentSelection = 0;
		}
	}
	
	yRoot = lerp(yRoot, 80, 0.1);
	
	draw_set_color(c_white);
	draw_set_font(global.timefont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var posX = (room_width / 2);
	
	flickertimer++;
	
	if flickertimer >= 40{
		draw = draw = 1 ? 0 : 1;
	
		flickertimer = 0;
	}
	
	if draw draw_text_underline(posX, 200, "press space");
	
	draw_set_font(global.numfont);
	draw_set_valign(fa_bottom);
	if global.highscore > 0 draw_text_underline(posX, room_height - 8, "highscore\n\n" + string(global.highscore));
}

stateSelect = function(){
	if keyboard_check_pressed(vk_escape) state = stateInitial;
	
	draw_set_font(global.timefont);
	
	yRoot = lerp(yRoot, 40, 0.1);
	xRoot = lerp(xRoot, 8, 0.5);
		
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	if keyboard_check_pressed(ord("S")) currentSelection = currentSelection = optionCount - 1 ? 0 : min(currentSelection + 1, optionCount - 1);
	if keyboard_check_pressed(ord("W")) currentSelection = currentSelection = 0 ? optionCount - 1 : max(currentSelection - 1, 0);
	
	var xOrigin = 8,
		yOrigin = room_width / 2 + 100,
		stringHeight = string_height(selectionString[0]),
		stringWidth = string_width(selectionString[0]),
		sep = 5,
		offset = 20;
		
	for(var i = 0; i < optionCount; i++){
		if currentSelection = i currentX[i] = lerp(currentX[i], offset, 0.1) else currentX[i] = lerp(currentX[i], xOrigin, 0.1);
		
		if point_in_rectangle(mouse_x, mouse_y, xOrigin, yOrigin + (stringHeight + sep) * i, xOrigin + (room_width - xOrigin * 2), yOrigin + (stringHeight + sep) * i + stringHeight){
			if (mouse_x != mouse_xprevious or mouse_y != mouse_yprevious){
				currentSelection = i;
			}
			
			selecting = true;
			continue;
		}
	}
	
	if (selecting && mouse_check_button_pressed(mb_left)) or keyboard_check_pressed(vk_space){
		switch(currentSelection){
			case 0:
				state = stateTransitionToGame;
			break;
			case 1:
				state = stateSettings;
				for(var i = 0; i < optionSettingsCount; i++){
					xSettingsRoot = -20;
					currentSettingsX[i] = xSettingsRoot;
					currentSettingsSelection = 0;
				}
			break;
			case 2:
				timer = 0;
				state = stateInitial;
			break;
		}
	}
	
	draw_text_underline(currentX[0], yOrigin, selectionString[0]);
	draw_text_underline(currentX[1], yOrigin + stringHeight + sep, selectionString[1]);
	draw_text_underline(currentX[2], yOrigin + (stringHeight + sep) * 2, selectionString[2]);
}

stateSettings = function(){
	if keyboard_check_pressed(vk_escape) state = stateSelect;
	
	draw_set_font(global.timefont);
	
	xRoot = lerp(xRoot, 8, 0.5);
		
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	if keyboard_check_pressed(ord("S")) currentSettingsSelection = currentSettingsSelection = optionSettingsCount - 1 ? 0 : min(currentSettingsSelection + 1, optionSettingsCount - 1);
	if keyboard_check_pressed(ord("W")) currentSettingsSelection = currentSettingsSelection = 0 ? optionSettingsCount - 1 : max(currentSettingsSelection - 1, 0);
	
	var xOrigin = 8,
		yOrigin = room_width / 2 + 100,
		stringHeight = string_height(settingsString[0]),
		stringWidth = string_width(settingsString[0]),
		sep = 5,
		offset = 20;
		
	for(var i = 0; i < optionSettingsCount; i++){
		if currentSettingsSelection = i currentSettingsX[i] = lerp(currentSettingsX[i], offset, 0.1) else currentSettingsX[i] = lerp(currentSettingsX[i], xOrigin, 0.1);
		
		if point_in_rectangle(mouse_x, mouse_y, xOrigin, yOrigin + (stringHeight + sep) * i, xOrigin + (room_width - xOrigin * 2), yOrigin + (stringHeight + sep) * i + stringHeight){
			if (mouse_x != mouse_xprevious or mouse_y != mouse_yprevious){
				currentSettingsSelection = i;
			}
			
			settingsSelecting = true;
			continue;
		}
	}
	
	if (settingsSelecting && mouse_check_button_pressed(mb_left)) or keyboard_check_pressed(vk_space){
		switch(currentSettingsSelection){
			case 0:
				global.dashInputType = global.dashInputType ? 0 : 1;
			break;
			case 1:
				global.volume = global.volume = 100 ? global.volume = 0 : global.volume + 10;
			break;
			case 2:
				global.screenshake = global.screenshake = 200 ? global.screenshake = 0 : global.screenshake + 10;
			break;
			case 3:
				state = stateSelect;
				
				ini_open("save.ini")
				
				ini_write_real("settings", "dashinputtype", global.dashInputType);
				ini_write_real("settings", "volume", global.volume);
				ini_write_real("settings", "screenshake", global.screenshake);
				
				ini_close();
				
				for(var i = 0; i < optionCount; i++){
					xRoot = -20;
					currentX[i] = xRoot;
					currentSelection = 0;
				}
			break;
		}
	}
	
	draw_text_underline(currentSettingsX[0], yOrigin, settingsString[0]);
	var str = string(global.dashInputType) = dashinput.double ? "double-tap" : "space";
	draw_text_underline(room_width - string_width(str) - xOrigin, yOrigin, str);
	
	draw_text_underline(currentSettingsX[1], yOrigin + stringHeight + sep, settingsString[1]);
	var str = string(global.volume) + "%";
	draw_text_underline(room_width - string_width(str) - xOrigin, yOrigin + stringHeight + sep, str);
	
	draw_text_underline(currentSettingsX[2], yOrigin + (stringHeight + sep) * 2, settingsString[2]);
	var str = string(global.screenshake) + "%";
	draw_text_underline(room_width - string_width(str) - xOrigin, yOrigin + (stringHeight + sep) * 2, str);
	
	draw_text_underline(currentSettingsX[3], yOrigin + (stringHeight + sep) * 3, settingsString[3]);
}

stateTransitionToGame = function() {
	if draw_transition(0){
		room_goto_next();
		transitionX += room_width;
		
		state = stateTransitionFromMenu;
	}
}

stateTransitionFromMenu = function() {
	if draw_transition(1){
		instance_destroy();
	}
}

state = stateInitial;