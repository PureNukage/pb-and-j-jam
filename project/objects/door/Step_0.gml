if opening {
	if animation_end {
		image_speed = 0
		image_index = image_number-1
		opened = true
		opening = false
	}
} else if closing {
	image_speed = 0
	image_index--	
	
	if image_index == 0 {
		image_index = 0
		opened = false
		closing = false
	}
}