extends TextureRect


func _on_touch_screen_button_pressed() -> void:
	get_tree().change_scene_to_file("res://capa/capa.tscn")
