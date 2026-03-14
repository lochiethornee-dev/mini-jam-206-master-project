extends Node2D

var cactispawned = 0

var fullheart = load("res://ARTS!/COWHORSE AND HOSE BOY/Full Heart.png")
var emptyheart = load("res://ARTS!/COWHORSE AND HOSE BOY/Empty Heart.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%cactustimer.wait_time = 12
	%cactustimer.start()
	Global.score = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%Score.text = "Score: " + str(Global.score)
	if Global.healthmanager == 3:
		%heart1.texture = fullheart
		%heart2.texture = fullheart
		%heart3.texture = fullheart
	elif Global.healthmanager == 2:
		%heart1.texture = fullheart
		%heart2.texture = fullheart
		%heart3.texture = emptyheart
	elif Global.healthmanager <= 1:
		%heart1.texture = fullheart
		%heart2.texture = emptyheart
		%heart3.texture = emptyheart




#SPAWNING OBSTACLES
func spawn_cactus():
	#print(%cactustimer.wait_time)
	var newcactus = preload("res://cactusobstacle.tscn").instantiate()
	%Obstaclepath.progress_ratio = randf()
	newcactus.global_position = %Obstaclepath.global_position
	add_child(newcactus)
	cactispawned += 1
	#print(cactispawned)
	if cactispawned == 100:
		%cactustimer.wait_time = 20
		%cactustimer.start()
	


func _on_cactustimer_timeout() -> void:
	
	
	if %cactustimer.wait_time > 1:
		#%cactustimer.wait_time = %cactustimer.wait_time - 1
		%cactustimer.wait_time = 1
		%cactustimer.start()
	spawn_cactus()


func _on_scoretick_timeout() -> void:
	if %Scoretick.wait_time != 1:
		%Scoretick.wait_time = 1
		%Scoretick.start()
	Global.score += 10
