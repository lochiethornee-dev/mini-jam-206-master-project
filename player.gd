extends CharacterBody2D

@export var speed = 400
@onready var bulletScene = load("res://playerbullet.tscn")

var health = 3

func _ready() -> void:
	var bullet = bulletScene.instantiate()
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	if Input.is_action_just_pressed("shoot") and %cooldown.is_stopped() or Input.is_action_pressed("shoot") and %cooldown.is_stopped():
		var bullet = bulletScene.instantiate()
		add_sibling(bullet)
		bullet.global_position = self.global_position
		%cooldown.start()


func damaged():
	if health > 0:
		health -= 1
		%Sprite2D.modulate = Color(0.788, 0.796, 0.639, 1.0)
		await get_tree().create_timer(.1).timeout
		%Sprite2D.modulate = Color(1,1,1)
	else:
		pass
