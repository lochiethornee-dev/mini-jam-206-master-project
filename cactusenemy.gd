extends CharacterBody2D

var alive = true
var health = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !alive:
		position.x += -115 * delta

func take_damage():
	if health <= 0:
		death()
		Global.score += 100
		

	else:
		health -= 1
		%Sprite2D.modulate = Color(0.788, 0.796, 0.639, 1.0)
		await get_tree().create_timer(.1).timeout
		%Sprite2D.modulate = Color(1,1,1)


func _on_area_2d_body_entered(body: Node2D) -> void:
	#if body.has_method("damaged"):
		#body.damaged(1)
	pass

func death():
	%deathdelay.start()
	%deathsound.play()
	%AnimationPlayer.play("death")
	$CollisionShape2D.set_deferred("disabled", true)
	%CollisionShape2Darea.set_deferred("disabled", true)
	alive = false
	


func _on_deathdelay_timeout() -> void:
	queue_free()
