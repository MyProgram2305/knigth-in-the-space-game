extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var tipo_roca = ["grande", "chico"]

func _ready():
	$animationrock.animation = tipo_roca[randi() % tipo_roca.size()]
	if $animationrock.animation == "grande":
		$CollisionShape2D.scale.x = 2.4
		$CollisionShape2D.scale.y = 2.3


func _on_visibilidad_screen_exited():
	queue_free() #elimina el objeto al salir de la pantalla	
