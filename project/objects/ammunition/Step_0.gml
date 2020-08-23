var distanceToPlayer = point_distance(x,y, player.x,player.y)

if distanceToPlayer < 120 {
	var Lerp = 0.03
	x = lerp(x, player.x, Lerp)
	y = lerp(y, player.y, Lerp)
	
	if distanceToPlayer < 24 {
		
		var Popup = instance_create_layer(x,y,"Instances",popup)
		Popup.color = c_red
		Popup.timer = 60
		Popup.text = "6"
		
		player.ammo += 6
		instance_destroy()
		
		sound.playSound(snd_itempickup)
	}
}