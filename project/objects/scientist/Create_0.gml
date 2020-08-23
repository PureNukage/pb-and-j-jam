batteries = 3

stage = 0

blowingUp = false
blowingUpTimer = 15
blowingUpCameraTimer = 240

room1Door = -1
room2Door = -1
room3Door = -1

ammoSpawned = false

//	Camera focus
cameraControl = false
cameraX = -1
cameraY = -1
cameraDuration = 120
cameraTime = time.stream

function cameraSet(x, y) {
	cameraTime = time.stream
	cameraControl = true
	cameraX = x
	cameraY = y
}

cameraSet(x,y)