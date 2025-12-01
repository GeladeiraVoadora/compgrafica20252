extends TextureRect


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://p5/pagina5.tscn")


func _on_seguir_pressed() -> void:
	get_tree().change_scene_to_file("res://contracapa/Contracapa.tscn")
