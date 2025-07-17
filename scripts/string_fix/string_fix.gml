///string_fix(number,places)
//Returns a zero-padded (or cut) string of the number so that it gets desired number of places.
function string_fix(){
	argument0 = string(floor(argument0));
	
	var del = string_length(argument0) - argument1;
	
	if del < 0 return string_repeat("0", -del) + argument0;
	else return argument0;
}