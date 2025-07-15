if keyboard_check_pressed(vk_escape){

global.inPauseMenu = global.inPauseMenu ? 0 : 1

	if global.inPauseMenu{
		if objPlayer.state = objPlayer.stateDead{ global.inPauseMenu = false; exit; }
		
		if !sprite_exists(pauseScreenshot){
			pauseScreenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), true, false, 0, 0);
		}
	
		currentViewScale = visCont.viewScale;
		currentGuiScale = visCont.guiScale;
		currentHealth = objPlayer.myHealth;
		currentMaxHealth = objPlayer.maxHealth;

		instance_deactivate_all(true);
	}
	else if !global.inPauseMenu{
		if sprite_exists(pauseScreenshot){
			sprite_delete(pauseScreenshot);	
		}
		instance_activate_all();
	}
}

if !global.inPauseMenu{
	currentTime += 1 / 60;

	if instance_number(objBug) < 10{
		var _time = currentTime > 120 ? 3 : 2;
			_realtime = currentTime mod _time;
	
		if _realtime = _time - 1{ //bugs
			var _x1 = 8 * 3,
				_y1 = 8 * 7,
				_x2 = room_width - _x1,
				_y2 = room_height - _y1 + 8 * 4,
				_chance = currentTime > 60 ? 50 : 75;
		
			repeat(random(100) >= _chance ? 3 : 2){
				with(instance_create_depth(random_range(_x1, _x2), random_range(_y1, _y2), depth, objSummonCircle)) summon = objBug;
			}
		}
	}

	if instance_number(objBuff) < 3{
		var _time = currentTime > 120 ? 8 : 6;
			_realtime = currentTime mod _time;
	
		if _realtime = _time - 1{ //buffs
			var _x1 = 8 * 3,
				_y1 = 8 * 7,
				_x2 = room_width - _x1,
				_y2 = room_height - _y1 + 8 * 4,
				_chance = currentTime > 60 ? 75 : 90;
		
			repeat(random(100) >= _chance ? 2 : 1){
				with(instance_create_depth(random_range(_x1, _x2), random_range(_y1, _y2), depth, objSummonCircle)) summon = objBuff;
			}
		}
	}

	if instance_number(objWizard) < 3{
		var _time = currentTime > 120 ? 6 : 5;
			_realtime = currentTime mod _time;
	
		if _realtime = _time - 1{ //wizards
			var _x1 = 8 * 3,
				_y1 = 8 * 7,
				_x2 = room_width - _x1,
				_y2 = room_height - _y1 + 8 * 4,
				_chance = currentTime > 60 ? 80 : 85;
		
			repeat(random(100) >= _chance ? 2 : 1){
				with(instance_create_depth(random_range(_x1, _x2), random_range(_y1, _y2), depth, objSummonCircle)) summon = objWizard;
			}
		}
	}

	if objPlayer.state = objPlayer.stateDead{
		deadTimer++;	
	}

	if deadTimer > 30{
		if keyboard_check(vk_escape) room_restart();
	}
}