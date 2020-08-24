if place_meeting(x,y,player) {
	gameFinished = true	
}

if gameFinished {
	countdown--
	
	if countdown <= 0 {
		room_goto(credits)	
	}
}