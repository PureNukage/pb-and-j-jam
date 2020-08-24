event_inherited()

knocked = false

alreadyUsed = false
myGoo = -1

bloodPuddleSize = -1
bloodPuddleAngle = -1
bloodPuddleFinished = false
function bloodPuddle() {
	
	var maxSize = 1
	if bloodPuddleSize == -1 {
		bloodPuddleSize = 0
	}
	else if bloodPuddleSize < maxSize {
		bloodPuddleSize = approach(bloodPuddleSize, maxSize, 0.05)
	} else {
		myGoo = instance_create_layer(x+(16*image_xscale),y+3,"Instances",goo)
		bloodPuddleFinished = true
	}
	
	draw_sprite_ext(s_goo, 0, x+(16*image_xscale), y+3, bloodPuddleSize, bloodPuddleSize, bloodPuddleAngle, c_white, 1)
}