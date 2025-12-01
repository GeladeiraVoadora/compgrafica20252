extends TextureRect


func _on_reiniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://capa/capa.tscn")
