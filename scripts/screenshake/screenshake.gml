/// @function                   screenshake(_time, _magnitude, _fade);
/// @param  {real}  _time       The length of time - in steps - to shake the screen
/// @param  {real}  _magnitude  The amount of screenshake to apply
/// @param  {real}  _fade       How quickly the screenshake effect will fade out
/// @description    Set the screenshake object variables.

function screenshake(_time, _magnitude, _fade){
	with (visCont){
		shake = true;
		shakeTime = _time;
		shakeMagnitude = _magnitude * (global.screenshake / 100);
		shakeFade = _fade;
	}
}