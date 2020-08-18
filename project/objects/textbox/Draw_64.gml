draw_set_color(c_black)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_speech)
var border = 32
var width = string_width(text) + border
var height = string_height(text) + border
var centerX = display_get_gui_width()/2
var centerY = display_get_gui_height()/2

draw_roundrect(centerX-width/2 -2, centerY-height/2 -2, centerX-width/2+width +2, centerY-height/2+height +2, false)

if point_in_rectangle(mouse_gui_x,mouse_gui_y, centerX-width/2, centerY-height/2, centerX-width/2+width, centerY-height/2+height) {
	draw_set_color(c_ltgray)	
	if input.mouseLeftPress {
		instance_destroy()	
	}
} else {
	draw_set_color(c_gray)
}
draw_roundrect(centerX-width/2, centerY-height/2, centerX-width/2+width, centerY-height/2+height, false)

draw_set_color(c_white)
draw_text(centerX-width/2 + width/2, centerY-height/2 + height/2, text)

draw_reset()