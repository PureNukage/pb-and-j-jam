if place_meeting(x,y,class_grab) {
	var ID = instance_place(x,y,class_grab)
	
	if ID.onGround {
		if !pressed {
			press()	
		}
	} else if pressed {
		release()	
	}
}

else if pressed {
	release()	
}