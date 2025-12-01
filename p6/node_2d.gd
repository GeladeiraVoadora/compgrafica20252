extends Node2D

var redes_apertado = false
var responsabilidades_apertado = false
var ja_ativou = false
@onready var pessoa = $pessoa
@onready var confete = $CPUParticles2D

func _ready() -> void:
	$pessoa.play("serio")

func _process(delta):
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		ativar_efeito()
		return

	if redes_apertado and responsabilidades_apertado:
		ativar_efeito()

func ativar_efeito():
	if ja_ativou: return 
	
	ja_ativou = true
	confete.emitting = true
	#print("SUCESSO!")
	pessoa.play("sorriso")

func _on_redes_pressed():
	$redes.modulate = Color(0.5,1,0.5)
	redes_apertado = true
	pessoa.play("triste")

func _on_redes_released():
	$redes.modulate = Color(1,1,1)
	redes_apertado = false
	pessoa.play("serio")

func _on_responsabilidades_pressed():
	$responsabilidades.modulate = Color(0.5,1,0.5)
	responsabilidades_apertado = true
	pessoa.play("triste")

func _on_responsabilidades_released():
	$responsabilidades.modulate = Color(1,1,1)
	responsabilidades_apertado = false
	pessoa.play("serio")
