pair = -1
pressed = false
image_speed = 0

function press() {
	sprite_index = s_button
	image_speed = 1
	
	if animation_end {
		image_index = image_number-1
		pressed = true
		image_speed = 0 
	}
}

function release() {
	sprite_index = s_button_reversed
	image_speed = 1
	
	if animation_end {
		image_index = image_number-1
		pressed = false 
		image_speed = 0 
	}
}