opened = false
opening = false
closing = false
image_speed = 0

Room = -1

function open() {
	image_speed = 1
	opening = true
}

function close() {
	image_speed = 0 
	closing = true
}