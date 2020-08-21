creator = ""
version = ""

var Layer = "Instances"
instance_create_layer(0,0,Layer,input)
instance_create_layer(0,0,Layer,debug)
instance_create_layer(0,0,Layer,time)
instance_create_layer(0,0,Layer,gui)
instance_create_layer(0,0,Layer,grid)

#region Camera

	width = 768
	height = 432

	#region Views

		view_enabled = true
		view_visible[0] = true

		view_set_visible(0,true)

		view_set_wport(0,width)
		view_set_hport(0,height)

	#endregion
	#region Resize and Center Game Window

		window_set_rectangle((display_get_width()-view_wport[0])*0.5,(display_get_height()-view_hport[0])*0.5,view_wport[0],view_hport[0])
	
		surface_resize(application_surface,view_wport[0],view_hport[0])
	
		display_set_gui_size(width,height)


	#endregion
	#region Camera Create

		camera = camera_create()

		var viewmat = matrix_build_lookat(width,height,-10,width,height,0,0,1,0)
		var projmat = matrix_build_projection_ortho(width,height,1.0,32000.0)

		camera_set_view_mat(camera,viewmat)
		camera_set_proj_mat(camera,projmat)
	
		camera_set_view_pos(camera,x,y)
		camera_set_view_size(camera,width,height)
	
		camera_set_view_speed(camera,200,200)
		camera_set_view_border(camera,width,height)
	
		camera_set_view_target(camera,id)

		view_camera[0] = camera

	#endregion
	
	function scale_canvas(new_width, new_height) {
		window_set_size(new_width, new_height)
	
		//if center {
		//	centerWindow = true
		//}
	
		surface_resize(application_surface,new_width,new_height)
	}
	
	scale_canvas(1920,1080)
	
	dragging = false
	anchorX = -1
	anchorY = -1
	
	zoom_level = 1
	default_zoom_width = camera_get_view_width(camera)
	default_zoom_height = camera_get_view_height(camera)

#endregion