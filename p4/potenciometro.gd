extends Sprite2D

@onready var balao_fala = get_node("../../BalaoFala") 

var esta_arrastando = false
var angulo_anterior = 0.0
var total_girado = 0.0 # Acumulador de graus
var ja_ativou = false

func _process(delta):
	if esta_arrastando and not ja_ativou:
		angulo_anterior = rotation
		
		look_at(get_global_mouse_position())
		
		rotation_degrees += 90
		var diferenca = rotation - angulo_anterior
		
		if diferenca > PI:
			diferenca -= 2 * PI
		elif diferenca < -PI:
			diferenca += 2 * PI
		
		total_girado += rad_to_deg(diferenca)
		
		#print("Giro total: ", int(total_girado))
		
		if abs(total_girado) >= 360:
			sucesso()

func sucesso():
	ja_ativou = true
	#print("DEU UMA VOLTA COMPLETA!")
	
	if balao_fala: 
		balao_fala.visible = true

func _on_area_toque_pressed():
	esta_arrastando = true
	total_girado = 0.0 
	angulo_anterior = rotation

func _on_area_toque_released():
	esta_arrastando = false
