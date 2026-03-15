extends CharacterBody2D

@onready var player = get_node("../../player")
@onready var bulletScene = load("res://alienbulletbasic.tscn")
@onready var marker = %Marker1

var alive = true
var health = 4
var speed = 1.2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#self.global_position.y = (player.global_position.y)
	var dir = (player.global_position.y - self.global_position.y)
	velocity.y = dir * speed
	move_and_slide()
	
	if global_position.x < 1121 and %cooldown.is_stopped() and alive == true:
		var bullet = bulletScene.instantiate()
		add_sibling(bullet)
		bullet.global_position = marker.global_position
		%shootgun.play()
		%cooldown.start()
		if marker == %Marker1:
			marker = %Marker2
		else:
			marker = %Marker1
			
	if alive == false:
		position.x += -115 * delta


func take_damage():
	if health <= 0:
		#queue_free()
		Global.score += 100
		death()
		

	else:
		health -= 1
		%Sprite2D.modulate = Color(0.788, 0.796, 0.639, 1.0)
		await get_tree().create_timer(.1).timeout
		%Sprite2D.modulate = Color(1,1,1)


func death():
	speed = 0
	alive = false
	%deathdelay.start()
	%deathsound.play()
	%AnimationPlayer.play("death")
	$CollisionShape2D.set_deferred("disabled", true)
	%movement.pause()


func _on_deathdelay_timeout() -> void:
	queue_free()
