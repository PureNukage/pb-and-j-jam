#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)

#macro maxDistanceFromPlayer 200

#macro animation_end (image_index >= image_number - 1)

enum state {
	idle,
	walk,
	aiming,
	shoot,
}