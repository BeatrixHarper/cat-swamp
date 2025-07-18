function play_sfx(_sound, _range, _gain, _overlap = false, _priority = 0, _loops = false, _offset = 0, _pitch = random_range(1 - _range, 1 + _range)){
	if audio_is_playing(_sound) && _overlap = false exit;
	
	audio_play_sound(_sound, _priority, _loops, _gain * global.volume / 100, _offset, _pitch);
}