extends Node2D

var shooter1spawned = 0
var dogspawned = 0
var intro = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%alienshooter1timer.wait_time = 15
	%alienshooter1timer.start()
	%aliendoggytimer.wait_time = 45
	%aliendoggytimer.start()
	
	



####################
#  ALIEN SHOOTER 1 #
####################
func spawn_alienshooter1():
	var newshooter1 = preload("res://alienshooter.tscn").instantiate()
	add_child(newshooter1)
	newshooter1.global_position.y = 400
	%alienshooter1timer.start()
	if intro == true:
		%alienshooter1timer.wait_time = 10
		%alienshooter1timer.start()
		intro = false
	#%alienshooter1timer.wait_time = %alienshooter1timer.wait_time - .5
	shooter1spawned += 1
	if shooter1spawned == 3:
		%alienshooter1timer.wait_time = 20
		%alienshooter1timer.start()

func _on_alienshooter_1_timer_timeout() -> void:
	spawn_alienshooter1()



####################
#    ALIEN DOGGY   #
####################

func _on_aliendoggytimer_timeout() -> void:
	spawn_aliendoggy()

func spawn_aliendoggy():
	var newdog = preload("res://aliendog.tscn").instantiate()
	add_child(newdog)

	%dogpath.progress_ratio = randf()
	newdog.global_position = %dogpath.global_position
	if %aliendoggytimer.wait_time > 2:
		%aliendoggytimer.wait_time = 2
	%aliendoggytimer.start()
	dogspawned += 1
	#if dogspawned == 3:
		#%aliendoggytimer.wait_time = 200
		#%aliendoggytimer.start()
