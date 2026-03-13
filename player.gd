extends CharacterBody2D

@export var speed = 400
@onready var bulletScene = load("res://playerbullet.tscn")


func _ready() -> void:
	var bullet = bulletScene.instantiate()
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	if Input.is_action_just_pressed("shoot") and %cooldown.is_stopped():
		var bullet = bulletScene.instantiate()
		add_sibling(bullet)
		bullet.global_position = self.global_position
		%cooldown.start()
