function draw_text_underline(_x, _y, _string, _colmain = c_white, _colback = c_black){
	draw_set_color(_colback)
	
	draw_text(_x, _y + 1, _string);
	draw_text(_x - 1, _y + 1, _string);
	draw_text(_x + 1, _y + 1, _string);
	
	draw_set_color(_colmain);

	draw_text(_x, _y, _string);
}