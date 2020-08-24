draw_set_color(c_black)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_speech)

var centerX = display_get_gui_width()/2

var YY = Y
var spacer = 45 
draw_text(centerX, YY, "made by") YY += spacer YY += spacer

draw_text(centerX, YY, "PureNukage") YY += spacer
draw_text(centerX, YY, "Sinecure") YY += spacer
draw_text(centerX, YY, "Kei") YY += spacer
draw_text(centerX, YY, "WormholeOracle") YY += spacer

draw_reset()