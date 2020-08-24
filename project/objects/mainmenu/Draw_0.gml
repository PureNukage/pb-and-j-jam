cursor_sprite = s_cursor_aim

draw_sprite(s_menu, 0, 0,0)

draw_set_color(c_white)
draw_text_outlined(15, room_height - 30, app.creator, c_white, c_black)

draw_sprite(s_menu_playgame, 0, 249 + buttonPlayX, 164)
if point_in_rectangle(mouse_gui_x,mouse_gui_y,249+buttonPlayX, 164, 249+buttonPlayX+sprite_get_width(s_menu_playgame), 164+sprite_get_height(s_menu_playgame)) {
	buttonPlayX = wave(-20, 20, 0.5, 0)
	
	if input.mouseLeftPress {
		room_goto(rm_slideshow)
		app.newRoom = true
		sound.playSound(snd_wind)
	}
} else {
	buttonPlayX = 0	
}

draw_sprite(s_menu_howto, 0, 249 + buttonHowX, 225)
if point_in_rectangle(mouse_gui_x,mouse_gui_y,249+buttonHowX, 225, 249+buttonHowX+sprite_get_width(s_menu_howto), 225+sprite_get_height(s_menu_howto)) {
	buttonHowX = wave(-20, 20, 0.5, 0)	
} else {
	buttonHowX = 0	
}

if os_version == os_windows {
	draw_sprite(s_menu_quit, 0, 249 + buttonQuitX, 288)
	if point_in_rectangle(mouse_gui_x,mouse_gui_y,249+buttonQuitX, 288, 249+buttonQuitX+sprite_get_width(s_menu_quit), 288+sprite_get_height(s_menu_quit)) {
		buttonQuitX = wave(-20, 20, 0.5, 0)	
	} else {
		buttonQuitX = 0	
	}
}