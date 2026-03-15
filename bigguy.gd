extends CharacterBody2D

var alive = true
var health = 25
@onready var bulletScene = load("res://alienbulletshotgun.tscn")

func _physics_process(delta: float) -> void:
	if global_position.x < 1121 and %cooldown.is_stopped():
		var bullet = bulletScene.instantiate()
		add_sibling(bullet)
		bullet.global_position = %Marker.global_position
		%cooldown.start()


	move_and_slide()
	
	if !alive:
		position.x += -115 * delta


func shoot():
	var bullet = bulletScene.instantiate()
	add_sibling(bullet)
	bullet.global_position = %Marker.global_position
	%shootgun.play()
	
	
func take_damage():
	if health <= 0:
		death()
		Global.score += 1000
	else:
		health -= 1
		%Sprite2D.modulate = Color(0.788, 0.796, 0.639, 1.0)
		await get_tree().create_timer(.1).timeout
		%Sprite2D.modulate = Color(1,1,1)
		
		
func death():
	%deathdelay.start()
	%deathsound.play()
	%walk.play("death")
	%movement.pause()
	$CollisionShape2D.set_deferred("disabled", true)
	alive = false


func _on_deathdelay_timeout() -> void:
	queue_free()
