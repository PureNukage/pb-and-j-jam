event_inherited()

if !knocked {
	if place_meeting(x,y,bullet) {
		knocked = true
		sprite_index = s_barrel_knocked
		bloodPuddleAngle = irandom_range(-15,15)
	}
	
}
//	Knocked over
else {
	if animation_end {
		image_index = image_number-1
	}
}

