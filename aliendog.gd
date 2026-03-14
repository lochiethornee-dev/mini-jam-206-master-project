extends StaticBody2D

var health = 0
var speed = 350
var yspeed = 100
var switch = false

func _physics_process(delta: float) -> void:
	position.x += -speed * delta
	if switch == false:
		position.y += -yspeed * delta
	elif switch == true:
		position.y += yspeed * delta



	if self.global_position.x < -100:
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("damaged"):
		body.damaged(1)


func take_damage():
	print(health)
	if health <= 0:
		queue_free()
		Global.score += 50
		

	else:
		health -= 1
		%Sprite2D.modulate = Color(0.788, 0.796, 0.639, 1.0)
		await get_tree().create_timer(.1).timeout
		%Sprite2D.modulate = Color(1,1,1)


func _on_switch_timeout() -> void:
	if switch == true:
		switch = false
	elif switch == false:
		switch = true
