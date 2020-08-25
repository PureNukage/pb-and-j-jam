if timer > 0 timer--
else {
	stage++
	timer = timerMax
	if stage >= array_length(slides) {
		room_goto(Room1)
		
		if audio_is_playing(snd_wind) audio_stop_sound(snd_wind)
	}
}

if stage < array_length(slides) {
	draw_sprite(slides[stage], 0, 0, 0)
	
	draw_set_color(c_white)
	draw_set_font(fnt_slides)
	draw_text_ext(179, 248, strings[stage],15,280)
}

if input.mouseLeftPress {
	timer = 0	
}