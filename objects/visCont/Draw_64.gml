draw_set_font(global.numfont);
draw_set_color(c_white);

var _srt = mainCont.currentTime;

draw_set_halign(fa_left);
draw_text_underline(8, 8, string(objPlayer.myHealth) + "/" + string(objPlayer.maxHealth))
draw_text_underline(8, 16, floor(_srt));

draw_set_halign(fa_right);
draw_text_underline(room_width - 8, 8, global.points);

if objPlayer.state = objPlayer.stateDead{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_underline(room_width / 2, room_height / 2, "score: " + string(global.points) + "\n\npress any to restart");
}