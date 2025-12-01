extends TextureRect

var tex_play = preload("res://assets/SpeakerHigh(1).png")
var tex_stop = preload("res://assets/SpeakerSimpleX.png")

func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://p5/pagina5.tscn")


func _on_seguir_pressed() -> void:
	get_tree().change_scene_to_file("res://contracapa/Contracapa.tscn")

func _on_speaker_pressed() -> void:
	
	var player = $Speaker/AudioStreamPlayer2D
	if player.playing and not player.stream_paused:
		$Speaker.texture_normal = tex_stop
		player.stream_paused = true
		return
	if player.stream_paused:
		$Speaker.texture_normal = tex_play
		player.stream_paused = false
		return
	
	player.play()
	$Speaker.texture_normal = tex_play


func _on_audio_stream_player_2d_finished() -> void:
	$Speaker.texture_normal = tex_stop
