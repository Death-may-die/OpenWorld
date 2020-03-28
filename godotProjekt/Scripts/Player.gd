extends KinematicBody2D

export(float) var dampening: float = 0.9
export(int) var speed: int = 800

var vel: Vector2 = Vector2.ZERO

func _ready() -> void:
	pass


func _process(delta : float) -> void:
	vel = lerp(Vector2.ZERO,vel,dampening)
	vel = move_and_slide(vel)
	var move : Vector2 = Vector2(
		int(Input.is_action_pressed("PlayerRight"))-int(Input.is_action_pressed("PlayerLeft")),
		int(Input.is_action_pressed("PlayerDown"))-int(Input.is_action_pressed("PlayerUp"))
	).normalized()
	vel += speed*move*delta
