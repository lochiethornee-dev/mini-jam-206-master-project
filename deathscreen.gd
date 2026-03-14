extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%score.text = "Score: " + str(Global.score)
	%score2.text = "High Score: " + str(Global.highscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level_main.tscn")
