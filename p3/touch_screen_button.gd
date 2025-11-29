extends TextureRect


func _on_touch_screen_button_pressed() -> void:
	get_tree().change_scene_to_file("res://p2/pagina2.tscn")


func _on_touch_screen_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://p4/pagina4.tscn")
