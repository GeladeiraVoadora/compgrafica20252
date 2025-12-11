extends Area2D

var arrastando = false

func _process(delta):
	if arrastando:
		global_position = get_global_mouse_position()
		
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

func verificar_vitoria():
	var areas_tocadas = get_overlapping_areas()
	
	for area in areas_tocadas:
		if area.name:
			$CollisionShape2D/Sprite2D.visible = false
			get_parent().muda(1.5, 90)
			return
