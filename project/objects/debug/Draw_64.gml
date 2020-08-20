if on {
	
	var XX = 15
	var YY = 15
	
	if instance_exists(crate) with crate {
		draw_text(XX,YY, "onGround: "+string(onGround)) YY += 15 
		draw_text(XX,YY, "thrust: "+string(thrust)) YY += 15 
		draw_text(XX,YY, "z: "+string(z)) YY += 15
		draw_text(XX,YY, "hspd: "+string(hspd)) YY += 15
		draw_text(XX,YY, "vspd: "+string(vspd)) YY += 15
	}
	
}