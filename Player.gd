extends Area2D
export (int) var velocidad
var movimiento=Vector2() 
var limite
signal golpe

func _ready():
	hide() #ocultar el personaje
	limite = get_viewport_rect().size


func _process(delta): #Como un ciclo for infinito
	movimiento=Vector2() #Movimiento = 0
	
	if Input.is_action_pressed("ui_right"):#Avanza a la derecha
		movimiento.x += 1
	if Input.is_action_pressed("ui_left"):#Avanza a la izquierda
		movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):#Avanza hacia abajo
		movimiento.y += 1
	if Input.is_action_pressed("ui_up"):#Avanza haccia arriba
		movimiento.y -= 1
	if movimiento.length() > 0: #Verifica si esta en movimiento
		movimiento=movimiento.normalized() * velocidad #Normaliza la velocidad 
	position += movimiento * delta #Actulaizar movimiento
	position.x = clamp(position.x ,0, limite.x) #Limite de x 
	position.y = clamp(position.y ,0, limite.y) #Limite de y
	
	if movimiento.x != 0:
		$spriteplayer.animation = "lado" #para que la animacion "lado" este cuando vayan a la derecha  
		$spriteplayer.flip_h = movimiento.x < 0 #invierte el la animacion "lado" cuando es menor a cero
		$spriteplayer.flip_v = false #restaura el personaje para que no vaya de cabeza
	elif movimiento.y != 0:
		$spriteplayer.animation = "atras" #para que la animacion "atras" este cuando vayan atras
		$spriteplayer.flip_v = movimiento.y > 0
	else:
		$spriteplayer.animation = "frente" #si no la animacion va a ser "frente"


func _on_Player_body_entered(body):
	hide()
	emit_signal("golpe") #emitir señal de que fue golpeado
	$CollisionShape2D.disabled = true

func inicio(pos):
	position = pos
	show() #mostrar el personaje
	$CollisionShape2D.disabled = false;
	
