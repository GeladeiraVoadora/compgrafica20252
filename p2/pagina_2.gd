extends TextureRect


func _on_touch_screen_button_pressed() -> void:
	get_tree().change_scene_to_file("res://p1/pagina1.tscn")


func _on_touch_screen_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://p3/pagina3.tscn")
