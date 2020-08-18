hspd = input.keyRight - input.keyLeft
vspd = input.keyDown - input.keyUp

//	If applying movement
if (hspd != 0 or vspd != 0) {
	sprite_index = s_walk
	if hspd != 0 image_xscale = hspd
	
	var Direction = point_direction(0,0,hspd,vspd)
	var Force = 5
	xx = lengthdir_x(Force, Direction)
	yy = lengthdir_y(Force, Direction)
	
} else {
	sprite_index = s_idle	
}

//	Apply movement
for(var W=0;W<abs(xx);W++) {
	if !place_meeting(x + sign(xx), y, collision) x += sign(xx)
}

for(var H=0;H<abs(yy);H++) {
	if !place_meeting(x, y + sign(yy), collision) y += sign(yy)	
}

xx = 0
yy = 0