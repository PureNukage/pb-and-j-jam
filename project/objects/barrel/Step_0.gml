event_inherited()

if !knocked {
	if room != Room4 {
		if place_meeting(x,y,bullet) {
			knocked = true
			sprite_index = s_barrel_knocked
			bloodPuddleAngle = irandom_range(-15,15)
		}
	}
	//	Boss fight barrels, ONLY knocked when destroying a battery
	else {
		if place_meeting(x,y,bullet) {
			if place_meeting(x,y,battery) and instance_place(x,y,battery).alive {
				knocked = true	
				sprite_index = s_barrel_knocked
				bloodPuddleAngle = irandom_range(-15,15)
			}
		}
	}
	
}
//	Knocked over
else {
	if animation_end {
		image_index = image_number-1
	}
}

