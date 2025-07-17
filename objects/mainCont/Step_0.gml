if room = rm1{
	if (instance_exists(objPlayer) && objPlayer.state != objPlayer.stateDead) or !instance_exists(objPlayer){
		if keyboard_check_pressed(vk_escape){

		global.inPauseMenu = global.inPauseMenu ? 0 : 1

			if global.inPauseMenu{
				if objPlayer.state = objPlayer.stateDead{ global.inPauseMenu = false; exit; }
		
				if !sprite_exists(pauseScreenshot){
					pauseScreenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
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
	}

	if !global.inPauseMenu{
		currentTime += 1 / 60;
		
		var _xorigin = 16,
			_yorigin = 48,
			_padding = 32,
			_x1 = _xorigin + _padding,
			_y1 = _yorigin + _padding,
			_x2 = room_width - _xorigin - _padding,
			_y2 = room_height - _xorigin - _padding;
		
		if instance_number(objBug) < 10{
			var _time = currentTime > 120 ? 2 : 3;
				_realtime = currentTime mod _time;
	
			if _realtime = _time - 1{ //bugs
				var _chance = currentTime > 60 ? 50 : 75;
		
				repeat(random(100) >= _chance ? 3 : 2){
					with(instance_create_depth(random_range(_x1, _x2), random_range(_y1, _y2), depth, objSummonCircle)) summon = objBug;
				}
			}
		}

		if instance_number(objBuff) < 3{
			var _time = currentTime > 120 ? 6 : 8;
				_realtime = currentTime mod _time;
	
			if _realtime = _time - 1{ //buffs
				var _chance = currentTime > 60 ? 75 : 90;
		
				repeat(random(100) >= _chance ? 2 : 1){
					with(instance_create_depth(random_range(_x1, _x2), random_range(_y1, _y2), depth, objSummonCircle)) summon = objBuff;
				}
			}
		}

		if instance_number(objWizard) < 3{
			var _time = currentTime > 120 ? 5 : 6;
				_realtime = currentTime mod _time;
	
			if _realtime = _time - 1{ //wizards
				var _chance = currentTime > 60 ? 80 : 85;
		
				repeat(random(100) >= _chance ? 2 : 1){
					with(instance_create_depth(random_range(_x1, _x2), random_range(_y1, _y2), depth, objSummonCircle)) summon = objWizard;
				}
			}
		}

		if objPlayer.state = objPlayer.stateDead{
			deadTimer++;
		}

		if deadTimer > 30 && objPlayer.state = objPlayer.stateDead{
			if keyboard_check_pressed(vk_enter){ deadTimer = 0; state = stateStartNewRun; }
			if keyboard_check_pressed(vk_escape){ deadTimer = 0; state = stateTransitionFromGame; }
		}
	}
}

if keyboard_check_pressed(vk_f4){
	global.fullscreen = global.fullscreen ? 0 : 1;
	window_set_fullscreen(global.fullscreen);
}