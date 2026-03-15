extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_boss_1_timer_timeout() -> void:
	%anim.play("bossmessage")


func spawn_bigguy():
	var bigguy = preload("res://bigguy.tscn").instantiate()
	add_child(bigguy)
	if %boss1timer2.wait_time > 30:
		%boss1timer2.wait_time = %boss1timer2.wait_time - 10
	%boss1timer2.start()

func _on_boss_1_timer_2_timeout() -> void:
	spawn_bigguy()
