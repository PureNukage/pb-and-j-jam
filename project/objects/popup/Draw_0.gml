y -= 2

if timer > -1 {
	timer--
	
	if timer == 0 {
		instance_destroy()
	}
}

draw_set_color(color)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_speech)
draw_text(x,y,text)

draw_reset()