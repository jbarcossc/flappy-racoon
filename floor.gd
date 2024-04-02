extends Node2D

var player
var SPEED = 100

func _ready():
	_setPos()
	player = get_node("../Player/Player")

func _on_player_death_body_entered(body):
	if body.name == "Player":
		player.kill()
		
func _process(delta):
	# Add the gravity.
	if not player.dead:
		position.x -= delta*SPEED
	if position.x < -2593:
		_setPos()

func _setPos():
	position.x = 670
	position.y = 465
