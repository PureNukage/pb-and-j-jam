if room == Room1 or room == Room2 or room == Room3 {
	if audio_is_playing(snd_music) {
		audio_stop_sound(snd_music)
		
		audio_play_sound(snd_music1, 0, true)
		audio_sound_gain(snd_music1, music_volume, 0)
	}
}

if room == Room4 {
	if audio_is_playing(snd_music1) or audio_is_playing(snd_music) {
		if audio_is_playing(snd_music1) audio_stop_sound(snd_music1)
		if audio_is_playing(snd_music) audio_stop_sound(snd_music)
		
		audio_play_sound(snd_music2, 0, true)
		audio_sound_gain(snd_music2, music_volume, 0)	
	}
}