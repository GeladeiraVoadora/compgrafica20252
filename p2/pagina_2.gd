extends TextureRect

var carta = preload("res://p2/carta.png")
var cartaAmigo = preload("res://p2/cartaamigo.png")
var cartaAmigoFechado = preload("res://p2/cartaamigofechada.png")

@onready var envelope = $Carta
@onready var animacao = $AnimationPlayer
@onready var telefone = $Telefone/Telefone

func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://p1/pagina1.tscn")


func _on_seguir_pressed() -> void:
	get_tree().change_scene_to_file("res://p3/pagina3.tscn")


func _on_carta_pressed() -> void:
	if envelope.texture_normal == carta:
		animacao.play("carta")
	elif envelope.texture_normal == cartaAmigoFechado:
		envelope.texture_normal = cartaAmigo

func _ready() -> void:
	telefone.scale = Vector2(0.06,0.06)
	telefone.play("telefone")


func _on_telefone_pressed() -> void:
	telefone.scale = Vector2(0.045,0.045)
	telefone.play("atendido")
