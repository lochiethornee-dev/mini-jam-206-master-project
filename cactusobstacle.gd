extends StaticBody2D


var speed = 115.5


func _physics_process(delta: float) -> void:
	position.x += -speed * delta



	if self.global_position.x < -100:
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("damaged"):
		body.damaged(1)
