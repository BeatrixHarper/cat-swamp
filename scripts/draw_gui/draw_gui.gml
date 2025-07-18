function draw_gui(){
	draw_set_valign(fa_top);
	draw_set_font(global.numfont);
	draw_set_color(c_white);

	var _srt = mainCont.currentTime,
		_hp = (global.inPauseMenu = true ? mainCont.currentHealth : objPlayer.myHealth) / 2,
		_maxhp = (global.inPauseMenu = true ? mainCont.currentMaxHealth : objPlayer.maxHealth) / 2,
		_hpfrac = frac(_hp),
		
		_hptext = string(_hp),
		_maxhptext = string(_maxhp),
		_healthXOrigin = 8,
		_healthYOrigin = 8,
		_hpSprite = sprHealth,
		_hpPadding = 1;

	for(var i = 1; i <= _maxhp; i++){
		var _hpX = _healthXOrigin + ((i - 1) * (sprite_get_width(_hpSprite) + _hpPadding)),
			_hpY = _healthYOrigin,
			_hpIndex = (i > floor(_hp)) + ((i == floor(_hp) + 1) && (_hpfrac > 0));
		
		draw_sprite_outline(c_white, _hpSprite, _hpIndex, _hpX, _hpY);
	}

	//for(var i = 0; i < _maxhp; i++){
	//	var _hpSprite = sprHealth,
	//		_hpPadding = 1,
	//		_hpX = _healthXOrigin + (i - (i > _maxhp / 2 - 1 ? 3 : 0)) * (sprite_get_width(_hpSprite) + _hpPadding),
	//		_hpY = _healthYOrigin + (i > _maxhp / 2 - 1 ? sprite_get_height(_hpSprite) + _hpPadding : 0);
			
	//		draw_sprite_outline(c_white, _hpSprite, i > _hp - 1 ? 1 : 0, _hpX, _hpY);
	//}

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(global.timefont);
	
	draw_text_underline(room_width / 2, room_height - 8, string("C ") + string(floor(_srt)));

	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_set_font(global.numfont);
	
	draw_text_underline(room_width - 8, 8, "score " + string_fix(global.points, 6));
	
	if !global.inPauseMenu{
		if objPlayer.state = objPlayer.stateDead{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			
			var _x = room_width / 2,
				_y = room_height / 2;
			
			var highscore = global.newScore ? "\n\n\n\nnew highscore!" : "\n\n";
			
			draw_set_font(global.timefont);
			draw_text_underline(_x, _y, "you died" + highscore + "\n\nscore: " + string(global.points) + (InputDeviceGetPlayerUsingGamepad() = 0 ? "\n\n\nstart to restart\n\nselect to exit" : "\n\n\n\nescape to restart\n\nspace to exit"));
		}
	}
}