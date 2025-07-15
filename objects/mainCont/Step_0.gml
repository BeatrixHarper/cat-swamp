currentTime += 1 / 60;

if instance_number(objWizard) < 10{
	if currentTime mod 3 = 2{ //bugs
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

if instance_number(objWizard) < 3{
	if currentTime mod 8 = 7{ //buffs
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
	if currentTime mod 6 = 5{ //wizards
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
	if keyboard_check(vk_anykey) room_restart();
}