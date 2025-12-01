extends Area2D

var temperatura = 0
var arrastando = false

func _ready():
	if get_parent() is Label:
		get_parent().text = "temperatura: aferindo..."

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if event.pressed:
			arrastando = true

func _input(event):
	if event is InputEventScreenTouch:
		if !event.pressed:
			if arrastando:
				arrastando = false
				verificar_temperatura() 
				aferir_temperatura()

func _process(delta):
	if arrastando:
		global_position = get_global_mouse_position()

func verificar_temperatura():
	var areas_tocadas = get_overlapping_areas()
	temperatura = 25 
	modulate = Color(1,1,1)
	
	for area in areas_tocadas:
		if area.name == "gelo": 
			temperatura = 0
			modulate = Color(0.5, 0.5, 1) 
		elif area.name == "fogo":
			temperatura = 600
			modulate = Color(1, 0.5, 0.5)

func aferir_temperatura():
	if "text" in get_parent():
		get_parent().text = "temperatura: " + str(temperatura) + "ºC"
	else:
		print("ERRO: O Pai deste nó não é um Label! Temp: ", temperatura)
