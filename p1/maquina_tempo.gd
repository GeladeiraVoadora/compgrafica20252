extends Area2D

var arrastando = false
var posicao_inicial

@onready var anim_sprite = $Sprite

func _ready():
	posicao_inicial = global_position
	anim_sprite.play("parado") 

func _on_input_event(viewport, event, shape_idx):
	
	if event is InputEventScreenTouch:
		if event.pressed:
			arrastando = true

func _input(event):
	if event is InputEventScreenTouch:
		if !event.pressed:
			if arrastando:
				arrastando = false
				verificar_vitoria()

func _process(delta):
	if arrastando:
		global_position = get_global_mouse_position()
		if anim_sprite.animation != "viajando":
			anim_sprite.play("viajando")

func verificar_vitoria():
	var areas_tocadas = get_overlapping_areas()
	
	for area in areas_tocadas:
		if area.name: 
			encaixar_e_mudar_animacao(area.global_position, area.name)
			return
	
	global_position = posicao_inicial
	anim_sprite.play("parado")

func encaixar_e_mudar_animacao(posicao_alvo, nome):
	var teste = get_parent()
	global_position = posicao_alvo
	anim_sprite.play("futuro")
	teste.muda_cena(nome)
	#print("Viagem no tempo realizada!")
