if timer > 0 timer--
else {
	stage++
	timer = 180
	if stage >= array_length(slides) {
		room_goto(Room1)
	}
}

if stage < array_length(slides) {
	draw_sprite(slides[stage], 0, 0, 0)
}

if input.mouseLeftPress {
	timer = 0	
}