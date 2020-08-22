opened = false
opening = false
closing = false
image_speed = 0

Room = -1

function open() {
	image_speed = 1
	opening = true
	
	sound.playSound(snd_door)
}

function close() {
	image_speed = 0 
	closing = true
	
	sound.playSound(snd_door)
}