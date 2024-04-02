extends Node2D
var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dead:
		if Input.is_action_just_pressed("ui_select"):
			Game.score = 0
			get_tree().reload_current_scene()

func reset():
	Game.maxScore = max(Game.score, Game.maxScore)
	await get_tree().create_timer(1.3, false, false, true).timeout
	dead = true
