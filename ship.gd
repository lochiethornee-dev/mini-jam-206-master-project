extends CharacterBody2D


@onready var player = get_node("../../player")
var speed = 1.2

func _physics_process(delta: float) -> void:
	var dir = (player.global_position.x - self.global_position.x)
	velocity.x = dir * speed
	move_and_slide()


func _on_timer_timeout() -> void:
	speed = 0
	%shoot.play("shoot")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("damaged"):
		body.damaged(1)


func _on_shoot_timer_timeout() -> void:
	%charge.play()


func _on_charge_finished() -> void:
	%shoot2.play()
