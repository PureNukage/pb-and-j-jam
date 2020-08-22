xx = lengthdir_x(Force, direction)
yy = lengthdir_y(Force, direction)

applyMovement()

if place_meeting(x+1,y+1,collision) or place_meeting(x-1,y-1,collision) {
	var ID1 = instance_place(x+1,y+1,collision)
	var ID2 = instance_place(x-1,y-1,collision)
	if (ID1 > -1 and !ID1.bulletPass) or (ID2 > -1 and !ID2.bulletPass) instance_destroy()	
}

if place_meeting(x,y,class_grab) {
	instance_destroy()	
}

depth = -y