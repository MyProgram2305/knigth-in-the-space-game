extends CanvasLayer

signal iniciar_juego


func mostrar_mensaje(texto):
	$mensaje.text=texto
	$mensaje.show()
	$mensajeTimer.start()

func game_over():
	mostrar_mensaje("Game over")
	yield($mensajeTimer, "timeout")
	$botonplay.show()
	$mensaje.text="kinght in the space"
	$mensaje.show()

func update_score(puntos):
	$scorelabel.text= str(puntos)
	


func _on_mensajeTimer_timeout():
	$mensaje.hide()


func _on_botonplay_pressed():
	$botonplay.hide()
	emit_signal("iniciar_juego")
