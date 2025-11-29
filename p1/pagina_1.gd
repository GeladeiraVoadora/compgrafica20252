extends TextureRect
@onready var animacao = $Node2D/animacoes


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://capa/capa.tscn")


func _on_seguir_pressed() -> void:
	get_tree().change_scene_to_file("res://p2/pagina2.tscn")

func muda_cena(cena) -> void:
	animacao.visible = true
	animacao.play(cena)
