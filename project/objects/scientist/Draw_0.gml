draw_self()

if blowingUp {
	if blowingUpTimer > 0 blowingUpTimer--
	else {
		
		var X = irandom_range(512, 895)
		var Y = irandom_range(0, 256)
		instance_create_layer(X,Y,"Instances",explosion)
		blowingUpTimer = 15
	}
}