extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawnbandage():
	var newbandage = preload("res://bandage.tscn").instantiate()
	%Obstaclepath.progress_ratio = randf()
	newbandage.global_position = %Obstaclepath.global_position
	add_child(newbandage)


func _on_bandagetimer_timeout() -> void:
	spawnbandage()
