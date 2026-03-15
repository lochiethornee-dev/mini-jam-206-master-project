extends StaticBody2D

var rng = RandomNumberGenerator.new()
var speed = 115.5

func _ready() -> void:
	var sprite = rng.randi_range(1, 3)
	#print(sprite)
	if sprite == 1:
		%Sprite2D.texture = load("res://ARTS!/enemys and obstavles/cacti/George.png")
	elif sprite == 2:
		%Sprite2D.texture = load("res://ARTS!/enemys and obstavles/cacti/SnactusMan.png")
	elif sprite == 3:
		%Sprite2D.texture = load("res://ARTS!/enemys and obstavles/cacti/Worm On A Cactus.png")

func _physics_process(delta: float) -> void:
	position.x += -speed * delta



	if self.global_position.x < -100:
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("damaged"):
		body.damaged(1)
