extends Node2D
var gametime = 0

var shipswitch = true

var shooter1spawned = 0
var dogspawned = 0
var intro = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%alienshooter1timer.wait_time = 15
	%alienshooter1timer.start()
	%aliendoggytimer.wait_time = 45
	%aliendoggytimer.start()
	
	
#func _physics_process(delta: float) -> void:
	#if gametime == 80 and shipswitch == true:
		#spawnship()


####################
#  ALIEN SHOOTER 1 #
####################
func spawn_alienshooter1():
	var newshooter1 = preload("res://alienshooter.tscn").instantiate()
	add_child(newshooter1)
	newshooter1.global_position.y = 400
	%alienshooter1timer.start()
	if intro == true:
		%alienshooter1timer.wait_time = 12
		%alienshooter1timer.start()
		intro = false
	#%alienshooter1timer.wait_time = %alienshooter1timer.wait_time - .5
	shooter1spawned += 1
	#print("shooters: " + str(shooter1spawned))
	if shooter1spawned == 3:
		%alienshooter1timer.wait_time = 20
		%alienshooter1timer.start()
	if shooter1spawned == 6:
		%alienshooter1timer.wait_time = 80
		%alienshooter1timer.start()
		intro = true
	if shooter1spawned >= 13 and %alienshooter1timer.wait_time > 1:
		%alienshooter1timer.wait_time -= 1

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
	#print("doggys: " + str(dogspawned))
	if dogspawned == 30:
		%aliendoggytimer.wait_time = 40
		%aliendoggytimer.start()



##################
# ALIEN SHIP!   #
#################
func spawnship():
	var newship = preload("res://ship.tscn").instantiate()
	add_child(newship)
	newship.global_position.x = 500
	if %shiptimer.wait_time >= 5:
		%shiptimer.wait_time -= 5




func _on_gametime_timeout() -> void:
	gametime += 1


func _on_shiptimer_timeout() -> void:
	spawnship()	
