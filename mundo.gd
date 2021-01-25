extends Node
export (PackedScene) var roca
var Score
func _ready():
	randomize()

func nuevo_juego():
	Score = 0
	$Player.inicio($posicionDeInicio.position) #posicion de inicio del jugador
	$inicioTimer.start()
	$interfaz.mostrar_mensaje("Ready!")
	$interfaz.update_score(Score)
	$audiogame.play()

func game_over():
	$scoreTimer.stop()
	$rocaTimer.stop()
	$interfaz.game_over()
	$audiogame.stop()
	$audiogameover.play()

func _on_inicioTimer_timeout():
	$rocaTimer.start()
	$scoreTimer.start()

func _on_scoreTimer_timeout():
	Score += 1
	$interfaz.update_score(Score)

func _on_rocaTimer_timeout():
	$camino/caminorocas.set_offset(randi()) #manda las rocas aleatoriamente

	var R = roca.instance()
	add_child(R)
	
	var D = $camino/caminorocas.rotation + PI/2 #selecciona una direccion

	R.position = $camino/caminorocas.position

	D += rand_range(-PI/4, PI/4)
	R.rotation = D
	R.set_linear_velocity(Vector2(rand_range(R.velocidad_min, R.velocidad_max), 0).rotated(D))

