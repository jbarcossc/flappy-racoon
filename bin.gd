extends CharacterBody2D

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../../Player/Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_death_body_entered(body):
	if body.name == "Player":
		player.kill()


func _on_player_point_body_entered(body):
	if body.name == "Player":
		get_node("../").SPEED += 10
		Game.score += 1
