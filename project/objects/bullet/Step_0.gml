xx = lengthdir_x(Force, direction)
yy = lengthdir_y(Force, direction)

applyMovement()

if place_meeting(x+1,y+1,collision) or place_meeting(x-1,y-1,collision) {
	instance_destroy()	
}