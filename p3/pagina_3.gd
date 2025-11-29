extends TextureRect

@onready var propaganda = $propaganda
@onready var tv = $tv
var playing = false
var ligada = preload("res://p3/tvligada.png")
var desligada = preload("res://p3/tvdesligada.png")


func _on_touch_screen_button_pressed() -> void:
	get_tree().change_scene_to_file("res://p2/pagina2.tscn")


func _on_touch_screen_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://p4/pagina4.tscn")
	

func _on_controle_pressed() -> void:
	if !playing:
		playing = true
		tv.texture = ligada
		propaganda.play()
	else:
		tv.texture = desligada
		propaganda.stop()
		playing = false


func _on_propaganda_finished() -> void:
	tv.texture = desligada
	playing = false
