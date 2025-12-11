extends TextureRect

@onready var propaganda = $propaganda
@onready var tv = $tv
var playing = false
var ligada = preload("res://p3/tvligada.png")
var desligada = preload("res://p3/tvdesligada.png")
var tex_play = preload("res://assets/SpeakerHigh(1).png")
var tex_stop = preload("res://assets/SpeakerSimpleX.png")


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://p2/pagina2.tscn")


func _on_seguir_pressed() -> void:
	get_tree().change_scene_to_file("res://p4/pagina4.tscn")
	

func _on_controle_pressed() -> void:
	if !playing and propaganda.paused == true:
		playing = true
		tv.texture = ligada
		propaganda.paused = false
	elif !playing:
		playing = true
		tv.texture = ligada
		propaganda.play()
	else:
		tv.texture = desligada
		propaganda.paused = true
		playing = false


func _on_propaganda_finished() -> void:
	tv.texture = desligada
	playing = false

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
