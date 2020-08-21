if on {
	
	var XX = 15
	var YY = 15
	
	draw_set_color(c_black)
	
	//if instance_exists(crate) with crate {
	//	draw_text(XX,YY, "onGround: "+string(onGround)) YY += 15 
	//	draw_text(XX,YY, "thrust: "+string(thrust)) YY += 15 
	//	draw_text(XX,YY, "z: "+string(z)) YY += 15
	//	draw_text(XX,YY, "hspd: "+string(hspd)) YY += 15
	//	draw_text(XX,YY, "vspd: "+string(vspd)) YY += 15
	//} 
	
	draw_text(XX,YY, "Camera_width: " + string(camera_get_view_width(app.camera))) YY += 15
	draw_text(XX,YY, "Camera_height: " + string(camera_get_view_height(app.camera))) YY += 15
	draw_text(XX,YY, "Camera_border_x: " + string(camera_get_view_border_x(app.camera))) YY += 15
	draw_text(XX,YY, "Camera_border_y: " + string(camera_get_view_border_y(app.camera))) YY += 15
	draw_text(XX,YY, "app_surface_width: " + string(surface_get_width(application_surface))) YY += 15
	draw_text(XX,YY, "app_surface_height: " + string(surface_get_height(application_surface))) YY += 15
	
	if instance_exists(player) with player {
		draw_text(XX,YY, "") YY += 15
		draw_text(XX,YY, "PLAYER") YY += 15
		draw_text(XX,YY, "") YY += 15
		
		draw_text(XX,YY, "hand.ID: "+string(hand.ID)) YY += 15
	}
	
}