pair = -1
pressed = false
image_speed = 0

function press() {	
	image_index = image_number-1
	pressed = true
	if pair > -1 and !pair.opened {
		pair.open()
	}
}

function release() {
	image_index = 0
	pressed = false
	if pair > -1 and pair.opened {
		pair.close()	
	}
}