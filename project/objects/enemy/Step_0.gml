var startingX = x
var startingY = y

if alive {
	switch(state)
	{
		#region Idle
			case state.idle:
		
				//	The Player is far away, lets idle walk
				var minDistance = 500
				if point_distance(x,y, player.x,player.y) > minDistance {
					idlewalk()
				}
				//	The Player is close by!
				else {
					var list = ds_list_create()
					var number = collision_line_list(x,y, player.x,player.y, collision, true, true, list, true)
					if ((number == 1 and list[| 0].bulletPass) or number == 0) or aggro {
						debug.log("The Player is close by!")
					
						aggro = true
					
						//	Find a point close-ish to the player
						var distance = 400
						var X = irandom_range(player.x, x)
						var Y = irandom_range(player.y, y)
					
						X = clamp(X, 0, room_width)
						Y = clamp(Y, 0, room_height)
						
						var list2 = ds_list_create()
						var numberOfCollisions = collision_line_list(X,Y, player.x,player.y, collision, true, true, list2, true)
						if ((numberOfCollisions == 1 and list2[| 0].bulletPass) or number == 0) {
					
							//	I can pathfind, lets start walking
							if pathfind(grid.mpGrid, path, x,y, X,Y) {
								goal.x = X
								goal.y = Y
								xGoto = path_get_point_x(path,pos)
								yGoto = path_get_point_y(path,pos)
								state = state.walk
							}
						}
						ds_list_destroy(list2)
					}
					
					else {
						idlewalk()	
					}
					ds_list_destroy(list)
				}
		
			break	
		#endregion
	
		#region Walk
			case state.walk:
			
				//	We've arrived at the next point in the path
				if point_distance(x,y, xGoto,yGoto) < 16 {			
					//	We're at the end of the path
					if pos++ == path_get_number(path)-1 {
						
						if aggro {
							state = state.aiming
							pause = 45
						}
						else state = state.idle
					}
					//	We have another point in the path
					else {
						xGoto = path_get_point_x(path,pos)
						yGoto = path_get_point_y(path,pos)
					}
				}
				//	We have not arrived, continue moving
				else {
					var Speed = 4
					var Direction_ = point_direction(x,y, xGoto,yGoto)
					applyForce(Direction_, Speed)
					
					//	Choose sprite
					if x < xGoto {
						image_xscale = -1
					} else if x > xGoto {
						image_xscale = 1	
					}
				}
			
			break
		#endregion
		
		#region Aim
			case state.aiming:
				
				if pause > -1 {
					pause--
					
					//	Make sure we're facing the player
					if player.x > x {
						image_xscale = -1	
					} else {
						image_xscale = 1	
					}
					
					//	Done aiming, lets shoot
					if pause == 0 {
						debug.log("I am shooting!")
						pause = 60
						state = state.shoot	
						
						//	Shoot
						var Bullet = instance_create_layer(x+ (-27 * image_xscale),y-19,"Instances",bullet)
						Bullet.direction = point_direction(x,y, player.x,player.y)
						Bullet.Force = 12
						Bullet.image_angle = Bullet.direction
						Bullet.killsEnemy = false
						
						sound.playSound(snd_enemy_fire)
					}
				}
				
			break
		#endregion
		
		#region Shooting
			case state.shoot:
				
				if pause > -1 {
					pause--
					
					//	Done pausing while shooting, lets move to another x, y
					if pause == 0 {
						pause = -1
						state = state.idle
					}
				}
				
			break
		#endregion
	}

	//	Enemy has been forced
	if force > 0 {
		applyForce(Direction, force)
		force--
	}

	//	I got shot!
	mask_index = sprite_index
	if place_meeting(x,y,bullet) and !imDamaged and instance_place(x,y,bullet).killsEnemy {
		doDamage(1)
		var Bullet = instance_place(x,y,bullet)
		Direction = point_direction(Bullet.x,Bullet.y, x,y)
		setForce(Direction, 5)
		
		//	Change direction when shot
		if Bullet.x > x {
			image_xscale = -1
		} else if Bullet.x < x {
			image_xscale = 1	
		}
		
		instance_destroy(Bullet)
		
		sound.playSound(choose(snd_enemy_hit_1, snd_enemy_hit_2, snd_enemy_hit_3))
	}
	mask_index = s_demon

	if imDamaged damaged()

	applyMovement()
}
//	Dead
else {
	if animation_end {
		image_index = image_number-1
		
		
	}
}

depth = -y