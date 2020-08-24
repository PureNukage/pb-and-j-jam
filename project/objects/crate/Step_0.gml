if alive {
	event_inherited()

	if place_meeting(x,y,bullet) and !imDamaged and !metalCrate {
		doDamage(1)
		if ammoCrate doDamage(2)
	}

	if imDamaged damaged()

	if hp <= 0 {
		if player.hand.ID == id {
			player.drop()	
		}
			
		if ammoCrate instance_create_layer(x,y-16,"Instances",ammunition)
	
		alive = false
	
	}

	if ammoCrate {
		sprite_index = s_box2	
	}

	if metalCrate {
		sprite_index = s_metalbox	
	}
} else {
	visible = false	
}