extends CPUParticles2D

# --- CONFIGURAÇÕES ---
const LIMITE_DB = -30.0    # Sensibilidade do microfone
const VELOCIDADE_LERP = 5.0 # Suavidade da animação

# Valores para quando está "calmo"
const SPREAD_MIN = 10.0
const LIFETIME_MIN = 0.5   # Vida curta = chama pequena
const SCALE_MIN = 1.0

# Valores para quando está "soprando no máximo"
const SPREAD_MAX = 90.0    # O que você pediu
const LIFETIME_MAX = 1.5   # Vida longa = chama alta e cheia (simula 2000 part)
const SCALE_MAX = 4.0

var mic_bus_index

func _ready():
	# IMPORTANTE: No Inspector, deixe o Amount em 2000!
	amount = 2000 
	mic_bus_index = AudioServer.get_bus_index("Mic" )
	
	# Começa pequeno
	spread = SPREAD_MIN
	lifetime = LIFETIME_MIN

func _process(delta):
	# 1. Pega o volume
	var volume_db = AudioServer.get_bus_peak_volume_left_db(mic_bus_index, 0)
	
	# Cheat para testar no PC apertando ESPAÇO
	if Input.is_action_pressed("ui_accept"):
		volume_db = -5.0
	
	# 2. Transforma volume em uma força de 0 a 1
	var forca = clamp(inverse_lerp(LIMITE_DB, 0.0, volume_db), 0.0, 1.0)
	
	# 3. APLICA AS MUDANÇAS (Usando lerp para ser suave)
	
	# Aumenta o espalhamento (0 a 90 graus)
	spread = lerp(spread, SPREAD_MAX, delta * VELOCIDADE_LERP)
	
	# Aumenta o tempo de vida (Simula o aumento de quantidade/altura)
	lifetime = lerp(lifetime, LIFETIME_MAX, delta * VELOCIDADE_LERP)
	
	# Aumenta o tamanho das partículas (Opcional, mas fica lindo)
	scale_amount_max = lerp(SCALE_MIN, SCALE_MAX, delta * VELOCIDADE_LERP)
	scale_amount_min = scale_amount_max * 0.7
