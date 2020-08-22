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
					var distance = 200
					var X = irandom_range(x-distance,x+distance)
					var Y = irandom_range(y-distance,y+distance)
			
					X = clamp(X, 0, room_width)
					Y = clamp(Y, 0, room_height)
				
					//	I can pathfind, lets start walking
					if pathfind(grid.mpGrid, path, x,y, X,Y) {
						goal.x = X
						goal.y = Y
						xGoto = path_get_x(path,pos)
						yGoto = path_get_y(path,pos)
						state = state.walk
					}
				
				}
				//	The Player is close by!
				else {
					debug.log("The Player is close by!")
				}
		
			break	
		#endregion
	
		#region Walk 
			case state.walk:
			
				//	We've arrived at the next point in the path
				if point_distance(x,y, xGoto,yGoto) < 24 {			
					//	We're at the end of the path
					if pos++ == path_get_number(path) {
						state = state.idle
					}
					//	We have another point in the path
					else {
						xGoto = path_get_x(path,pos)
						yGoto = path_get_y(path,pos)
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
	}

	//	Enemy has been forced
	if force > 0 {
		applyForce(Direction, force)
		force--
	}

	//	I got shot!
	if place_meeting(x,y,bullet) and !imDamaged {
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
	}

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