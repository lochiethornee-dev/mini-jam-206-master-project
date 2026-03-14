extends CharacterBody2D

@onready var player = get_node("../../player")
@onready var bulletScene = load("res://alienbulletbasic.tscn")
@onready var marker = %Marker1

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
	
	if global_position.x < 1121 and %cooldown.is_stopped():
		var bullet = bulletScene.instantiate()
		add_sibling(bullet)
		bullet.global_position = marker.global_position
		%cooldown.start()
		if marker == %Marker1:
			marker = %Marker2
		else:
			marker = %Marker1


func take_damage():
	if health <= 0:
		queue_free()
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
