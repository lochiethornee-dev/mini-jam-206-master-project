extends Node2D

var speed = 1000
var yspeed = 250
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%straight1.position.x += -speed * delta
	%up1.position.x += -speed * delta
	%up1.position.y += -yspeed * delta
	%down1.position.x += -speed * delta
	%down1.position.y += yspeed * delta

func _on_straight_1_body_entered(body: Node2D) -> void:
		if body.has_method("damaged"):
			body.damaged(1)
			%straight1.visible = false
			%straightshape.set_deferred("disabled", true)


func _on_up_1_body_entered(body: Node2D) -> void:
		if body.has_method("damaged"):
			body.damaged(1)
			%up1.visible = false
			%upshape.set_deferred("disabled", true)


func _on_down_1_body_entered(body: Node2D) -> void:
		if body.has_method("damaged"):
			body.damaged(1)
			%down1.visible = false
			%downshape.set_deferred("disabled", true)
