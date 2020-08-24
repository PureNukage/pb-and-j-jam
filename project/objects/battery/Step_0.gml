if place_meeting(x,y, barrel) and instance_place(x,y, barrel).knocked and alive {
	var ID = instance_place(x,y,barrel)
	if !ID.alreadyUsed {
		ID.alreadyUsed = true
		alive = false	
	}
}

if !alive {
	sprite_index = s_wire_destroyed
}