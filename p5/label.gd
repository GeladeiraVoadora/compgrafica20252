extends Label

var passos = 0
var pode_contar = true
var liberado = false

const FORCA_PARA_PASSO = 12.0
const TEMPO_ENTRE_PASSOS = 0.4
@onready var sapato = $AnimatedSprite2D
@onready var comentarios = $comentarios
@onready var botaoPublicar = $publicar

func _ready():
	text = "0"
	sapato.play("parado")
	$publicar.texture_normal = preload("res://p4/publicarDesligado.png")
	$comentarios.visible = false

func _process(delta):
	var aceleracao = Input.get_accelerometer()
	var forca_total = aceleracao.length()
	var detectou_movimento = (forca_total > FORCA_PARA_PASSO)
	
	if Input.is_action_just_pressed("ui_accept"): 
		detectou_movimento = true
	
	if detectou_movimento and pode_contar:
		contar_passo()
	
	if passos > 0:
		botaoPublicar.texture_normal = preload("res://p4/publicarLIgado.png")
		liberado = true

func contar_passo():
	sapato.play("correndo")
	passos += 1
	text = str(passos)
	#print("Passo detectado! Total: ", passos)
	
	pode_contar = false
	
	await get_tree().create_timer(TEMPO_ENTRE_PASSOS).timeout
	
	pode_contar = true

func _on_publicar_pressed() -> void:
	if liberado:
		comentarios.visible = true
		comentarios.play("comentarios")
	else:
		pass
